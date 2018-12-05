/**
 * Copyright (c) 2015-present, Facebook, Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import <React/RCTBridge.h>
#import <React/RCTDefines.h>

@protocol RCTPackagerClientMethod;

/**
 * An abstraction for a key-value store to manage RCTDevSettings behavior.
 * The default implementation persists settings using NSUserDefaults.
 */
@protocol RCTDevSettingsDataSource <NSObject>

/**
 * Updates the setting with the given key to the given value.
 * How the data source's state changes depends on the implementation.
 */
- (void)updateSettingWithValue:(id)value forKey:(NSString *)key;

/**
 * Returns the value for the setting with the given key.
 */
- (id)settingForKey:(NSString *)key;

@end

@interface RCTDevSettings : NSObject

- (instancetype)initWithDataSource:(id<RCTDevSettingsDataSource>)dataSource;

@property (nonatomic, readonly) BOOL isLiveReloadAvailable;
@property (nonatomic, readonly) BOOL isRemoteDebuggingAvailable;
@property (nonatomic, readonly) BOOL isNuclideDebuggingAvailable;

/**
 * Whether the bridge is connected to a remote JS executor.
 */
@property (nonatomic, assign) BOOL isDebuggingRemotely;

/*
 * Whether shaking will show RCTDevMenu. The menu is enabled by default if RCT_DEV=1, but
 * you may wish to disable it so that you can provide your own shake handler.
 */
@property (nonatomic, assign) BOOL isShakeToShowDevMenuEnabled;

/**
 * Whether automatic polling for JS code changes is enabled. Only applicable when
 * running the app from a server.
 */
@property (nonatomic, assign, setter=setLiveReloadEnabled:) BOOL isLiveReloadEnabled;


/**
 * Enables starting of profiling sampler on launch
 */
@property (nonatomic, assign) BOOL startSamplingProfilerOnLaunch;


#if RCT_DEV
- (void)addHandler:(id<RCTPackagerClientMethod>)handler forPackagerMethod:(NSString *)name __deprecated_msg("Use RCTPackagerConnection directly instead");
#endif

@end

@interface RCTBridge (RCTDevSettings)

@property (nonatomic, readonly) RCTDevSettings *devSettings;

@end
