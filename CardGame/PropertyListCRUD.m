//
//  PropertyListCRUD.m
//  Exercicio pList
//
//  Created by Rafagan Abreu on 23/01/14.
//  Copyright (c) 2014 Rafagan Abreu. All rights reserved.
//

#import "PropertyListCRUD.h"

@implementation PropertyListCRUD

@synthesize pListPath;

- (instancetype)initWithPropertyListName:(NSString *)name
{
    self = [super init];
    if (self) {
        _pListName = name;
        NSString* fileType = @"plist";
        
        //Pega todos os caminhos de diretório para armazenamento de arquivos disponíveis
        NSArray *directoryPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        
        //Pega o primeiro diretório válido
        _validDirectoryPath = directoryPaths[0];
        
        //Diretório válido para o pList
        _validDirectoryPath = pListPath = [_validDirectoryPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",_pListName,fileType]];
        
        //Se não existir um caminho válido para o diretório, cria a partir do MainBundle (espaço de memória temporário do app)
        if(![[NSFileManager defaultManager] fileExistsAtPath:pListPath]) {
            pListPath = [[NSBundle mainBundle] pathForResource:_pListName ofType:fileType];
            [[[NSMutableDictionary alloc]init] writeToFile:_validDirectoryPath atomically:YES];
        }
    }
    return self;
}

- (NSMutableDictionary *)loadData
{
    //Também é possível capturar o NSData por meio do NSFileManager e depois converter o raw em Dictionary
    NSMutableDictionary* data = [NSMutableDictionary dictionaryWithContentsOfFile:pListPath];
    return data;
}

- (void)saveData:(NSMutableDictionary *)content
{
    //Também é possível criar um NSData do dicionário e convertê-lo em Property List XML 1.0
    NSMutableDictionary *data = [NSMutableDictionary dictionaryWithDictionary:content];
    [data writeToFile:_validDirectoryPath atomically:YES];
}

@end
