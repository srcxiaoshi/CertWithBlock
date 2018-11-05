//
//  SRCNetworkWithAF.h
//  SRCFoundation
//
//  Created by 史瑞昌 on 2018/9/7.
//  Copyright © 2018年 史瑞昌. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SRCNetworkReachabilityStatus) {
    SRCNetworkReachabilityStatusUnknown          = -1,
    SRCNetworkReachabilityStatusNotReachable     = 0,
    SRCNetworkReachabilityStatusReachableViaWWAN = 1,
    SRCNetworkReachabilityStatusReachableViaWiFi = 2,
};



@interface SRCNetworkWithAF : NSObject

//使用这个属性，监控网络状态
@property (assign,nonatomic) SRCNetworkReachabilityStatus reachAbility;



/**
 * GET：获取资源，不会改动资源
 * POST：创建记录
 * PATCH：改变资源状态或更新部分属性
 * PUT：更新全部属性
 * DELETE：删除资源
 */


/**
 *  请求网络数据
 *
 *  @param path             请求的路径
 *  @param parameters        请求的参数
 *  @param downLoadProgress  进度
 *  @param success          请求成功的回调
 *  @param failure          请求失败的回调
 */
+(void)requestGetMethodWithPath:(NSString *)path parameters:(NSDictionary *)parameters withProgress:(void(^) (float progress))downLoadProgress success:(void(^) (BOOL isSuccess, NSString * response))success failure:(void(^) (NSError *error))failure;

/**
 *  上传网络数据
 *
 *  @param path             请求的路径
 *  @param parameters        请求的参数
 *  @param upLoadProgress   进度
 *  @param success          请求成功的回调
 *  @param failure          请求失败的回调
 */
+(void)requestPostMethodWithPath:(NSString *)path parameters:(NSDictionary *)parameters withProgress:(void(^) (float progress))upLoadProgress success:(void(^) (BOOL isSuccess, NSString * response))success failure:(void(^) (NSError *error))failure;


/**
 *  更新全部属性
 *
 *  @param path             请求的相对路径 host之后的
 *  @param paramters        请求的参数
 *  @param success          请求成功的回调
 *  @param failure          请求失败的回调
 */
+ (void)requestPutDataWithPath:(NSString *)path withParamters:(NSDictionary *)paramters success:(void(^) (BOOL isSuccess, id responseObject))success failure:(void(^) (NSError *error))failure ;


/**
 *  更新部分属性和改变资源状态
 *
 *  @param path             请求的相对路径 host之后的
 *  @param paramters        请求的参数
 *  @param success          请求成功的回调
 *  @param failure          请求失败的回调
 */
+ (void)requestPatchDataWithPath:(NSString *)path withParamters:(NSDictionary *)paramters success:(void (^) (BOOL isSuccess, id responseObject))success failure:(void (^) (NSError *error))failure ;

/**
 *  删除网络数据
 *
 *  @param path             请求的相对路径 host之后的
 *  @param paramters        请求的参数
 *  @param success          请求成功的回调
 *  @param failure          请求失败的回调
 */
+ (void)requestDeleteDataWithPath:(NSString *)path withParamters:(NSDictionary *)paramters success:(void (^) (BOOL isSuccess, id responseObject))success failure:(void (^) (NSError *error))failure ;

/**
 *  取消网络请求--全部请求
 *
 */
+ (void)cancelAllNetworkRequest;


/**
 *  取消指定的url请求
 *
 *  @param type 请求的请求类型
 *  @param path 请求的完整url
 */
+(void)cancelRequestWithType:(NSString *)type WithPath:(NSString *)path ;


/**
 *  获取网络状态
 *  返回结果字符串
 */
+(NSString *)reachAbilityString;

 
/**
 * 根据url下载image 返回task
 *
 **/
+(NSURLSessionTask *)downloadFileWithURL:(NSURL *)url prograss:(void(^) (float prograss))prograssBlock completion:(void(^)(NSURL *filepath))completionBlock;


/**
 *  取消对应的任务
 *
 */
+(void)cancelTask:(NSURLSessionTask *)task;



@end
