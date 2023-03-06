Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFBAE6AC344
	for <lists+linux-mips@lfdr.de>; Mon,  6 Mar 2023 15:31:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbjCFOba (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Mar 2023 09:31:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbjCFOb2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Mar 2023 09:31:28 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBCCA2DE63
        for <linux-mips@vger.kernel.org>; Mon,  6 Mar 2023 06:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678113046; x=1709649046;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fK8ov/LZBNS9+SxEzz6GL6CGOV5bx/1IT56SepD4itw=;
  b=Tb5ugtojhtPXiqJttUbugb3CAf5OuEmkXBQx/zmy3eVPgwBG29J5AE5z
   H9gn1I1MHwiBLWVNOjz+RCUEKp5q+VT4hpz//jzHe28trqz1ya32Srf3K
   Q0skQ2I6XLVmoXeX1ytYnNLyClXTQn/6/3UI6kXqSZ2VjNjRQZEuAzLWI
   Hv2nuudwdNmRVMOZFnj4ogkoj36MMF4zIZTvsAlVgFAGjDTfkY326oiWK
   jOuRlbcAB6m5/hhPEpt2meMpSbja0Xw7zvqXvK64NTCVDJ+CvhGXt0HIc
   v4YJKuBPQVi8/zzOqWH8mF1huoFX+BD5Mz1MTQ+sTaALd/w6Np4HUY70T
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="333039294"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="333039294"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 06:29:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="921947969"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="921947969"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga006.fm.intel.com with ESMTP; 06 Mar 2023 06:29:30 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 6 Mar 2023 06:29:30 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 6 Mar 2023 06:29:30 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 6 Mar 2023 06:29:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BEXftgpSrMdFB7JczvDFQJOPKGDGvOWamgIRzQn1bJERrvbAnj2B2oBuqMxfK5JywxGMtPi6GQ7enkXu3RRKhAN9zwYk8p1iyrv8d7a7jWOIYaERg7tcKLiWDy9Ld16ZH1Is3PjQW1QciI/B9RYbjw9bT/Mrs7TdLfLhk1KVLhfax97yNcXSbPfeoMrxttozXu/4tG79OXSJ/S8wDZEKTdz+tKFXPQaiKTLRHjTMaH7/rd2D90zU+BXtMaKwUq8tE04UhfOLBO1WD5Su8o2eojVK6FZ0i7U3VpPRn6HLM2G4PCkXxENXa2RjDzVwfFqicFDS4gWuCPpyi1+PQr2w2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dF1KgpyjqsHauUA3Qj9oeGQcAA+/DYPAaCuvIfjV+y0=;
 b=Y0wuksi2ue/KEqHMh+ih7u34BXmuZa40XhRQcYnUaiJKZjbUF9vBeOGg0vU7OdfX1H9CRbomChvL8heIkBwEXrWDIpgmJ+TTlzM+JmES0o7bJdPj3Pz60iPwRi4H9/nNtUqDSyNubCK5hCRD0fOBlpKZzdx0HIVQNMKDB1fwncTVOUY1ztdn2rssd1YpM02Z9+34xohrmGk9PmHoyA8+tk7pwwhlICHRKL2ClMyd3VcwJG/pRX+RosRXpVCdgWWBFWrxI4EVVJwgRCnoaA7ekVMFkvGbbE9kUPSV1xQ3Xyv9sOKLY6sIRZnbzauZaAqHJecEym4mI3GT2aeqGVO7FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3625.namprd11.prod.outlook.com (2603:10b6:5:13a::21)
 by MN6PR11MB8147.namprd11.prod.outlook.com (2603:10b6:208:46f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Mon, 6 Mar
 2023 14:29:23 +0000
Received: from DM6PR11MB3625.namprd11.prod.outlook.com
 ([fe80::3ff6:ca60:f9fe:6934]) by DM6PR11MB3625.namprd11.prod.outlook.com
 ([fe80::3ff6:ca60:f9fe:6934%4]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 14:29:23 +0000
Message-ID: <b09d488f-ba4c-dba3-e2ee-87b5660dbdda@intel.com>
Date:   Mon, 6 Mar 2023 15:28:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 04/12] MIPS: Octeon: Opt-out 4k_cache feature
Content-Language: en-US
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
CC:     <linux-mips@vger.kernel.org>, <tsbogend@alpha.franken.de>,
        <philmd@linaro.org>
References: <20230304221524.47160-1-jiaxun.yang@flygoat.com>
 <20230304221524.47160-5-jiaxun.yang@flygoat.com>
From:   Alexander Lobakin <aleksander.lobakin@intel.com>
In-Reply-To: <20230304221524.47160-5-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0204.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::9) To DM6PR11MB3625.namprd11.prod.outlook.com
 (2603:10b6:5:13a::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3625:EE_|MN6PR11MB8147:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c85b306-7db3-4b72-3538-08db1e4f2e30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lDiRppfaffAAplldMZAPIlfhjCuZFyPw3OfassibkltfhcMADEGUmh6Z44L79Br9mx+LUV7lRwxm6MJMaQ+L2inxRN64A6/5RjcdbB7ZnZGnog4zn1Ud8aRCm/p9nxtoMvz+cZZur6G73CJPM+4Oxyi+F7MWQRyVFqsUAuo/p3x0QmVB4fuag6jN3oLs9XELe+CKIZNawKXbXkFvtu7Uo2FLl9kZadsuCRRI2UMflrySdcv7sdqadCGbBXCj9xldErWDrp406uKXOV0ry9ZxHvUO3sK2NID0aBv9YIFIU6cPSKisYKjC0myV/Eakqwd18Wirmhgg4KOjfFuX9lXvibkiB3qz3I9KvN8pxFap20dBmR0mIzVaE1AzTT70MwBdksPmZeVkxZ4IEbY68xCE+oOEJaFs1hIhQqY5x1m79/K3DHmG/bpCRVNSNu3aOekJ8bHX2lD58tCZm0TVEQ101PE4+ZJKApp6GFFzTTeBZLQvlqCM2Bi7nOGZOO9iYHmx0LSBe9kl5fE8havYHgUxqRpSDmx7TdAkW/YpCjHlzo2T3rOLTSZ12r34cfkm1V8qveFD+w9VqhnTvnMpzcG2WU4mRBUExHKKiS8vPPqY4E3yWoOJ3BEgnfRyt7nre9YZwram4qa4+z5QpwS0hm7bqTgi+oKQqwqPLRqEOcqM7VKTLjHMq0AsJvnwDCTm681ooXZHDSGo2vnavwX9SAQkus4DMCGB3I3/a7cigeVELeY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3625.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199018)(31686004)(6666004)(83380400001)(36756003)(478600001)(316002)(38100700002)(2616005)(82960400001)(5660300002)(6486002)(6512007)(41300700001)(26005)(6506007)(66556008)(186003)(8936002)(66476007)(8676002)(2906002)(6916009)(66946007)(31696002)(86362001)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGhzZEZRSEtFMVZIMkJiZlJNRGR2RWxLbVBkRVVrVVZoaWFvUFliSDFKMDJS?=
 =?utf-8?B?WTN0VGRLVzVOZUJ1ODRVMWk3Y2JPSlF3anc3UktPSUUzUEIwUnFnNDZQMFRY?=
 =?utf-8?B?Y2FyMkFNeDN3OXB0VURmeE11N3YzRGtnd1oxQlMxdkliaVJqbWNwak8rZ0pX?=
 =?utf-8?B?c0pocEYzVjMrZ2RQQTRYek5lNytwenNsSWlzU2N2eDFnbndUWWE4VFEwWldo?=
 =?utf-8?B?TEZzTkRvUHBDNVZ1cmtpNWVhbk1UNkxqTjBobDlodjZJVGRiNEo5WFZ2NjRQ?=
 =?utf-8?B?aEtBbFh1QW85YVNMNnkxWDNkbG9iVndzSllKTVFGQW04aXVzeFgxcGNXTk1m?=
 =?utf-8?B?K1c2VjF1T24rL3FySnJjbk1oZ3ZVblB4MUJGZGdNS0VNQWtCekRKYWF0Sk5K?=
 =?utf-8?B?S2x2d1BYUlRtZ1NTR1FXcDJJcmdqRlh2VkgzcjdqcUtyVnZuTkFZc0ZXc0hZ?=
 =?utf-8?B?RHc3Q2d3V1lWbUxnMDBtazhPYUdlVkQ1bWhkZE9mNDE0OGtIMEprV1kwRXBz?=
 =?utf-8?B?aFk3VW9ac1lMQVhKeE9UUzNZS0J0bmZyamtLQ1BQOGpvR0VGNlg4ZC9zT1Mw?=
 =?utf-8?B?RlVxaVNRM0wvRFNNaC9PYlVJeUxya3p4bUJWK0JMZmVSTkRzdndEYTYvbjhM?=
 =?utf-8?B?MVhWeDhVSFJKMFdKRlBvZll1N3NyS2hUTUxPREpORU9jbWZUU2plNFRyYlB4?=
 =?utf-8?B?bXloc25qQjh3VXNhMVdZa042bWp3SExaTTFyMzYxZ1RZaXNhbGRJUVRrWGJX?=
 =?utf-8?B?MmZqY1ZVTXF2QWZuNjZYTFhHMUlROE1HN3cvZlMzWFVKVGVUeXljMnpWT0VL?=
 =?utf-8?B?SndkSWpRMWJFRktaNGVxam1PbTZNd0hUNVV5dUFYdEs2WTBhT0RpNXFjM3hv?=
 =?utf-8?B?TnNCY09DeWNwcmd6NUtYVGNnZXVQRVpiMHgwbDh4dnFQRUxMRVdoUUNwcnM3?=
 =?utf-8?B?QjVCbThRU1RKaE1vUGY5ODErdEc0TDQvb0RHcHB4TC9rdlFlSWNQUWNacmNY?=
 =?utf-8?B?OTJoSDhvbGRqZVBLajVYQU51US90Yk1kOTJvYkFkWktyNXlMM1FoSlZSbGtQ?=
 =?utf-8?B?bW5pWTFqWVczMXUxcXl4eDRycUdtaUNIQ1JpeUdhOCtlTWhqblpqdEY2SWQy?=
 =?utf-8?B?Q3hwTHVMUVlPZU1FK3prVUEvZXlKTktyZkNBTXdZbHJ3d1ZmMDIyNmI1L3RT?=
 =?utf-8?B?a3JUYnV4eHcxTUhqdTd2YWoydWpKSmRpczV1UngyNUFqUGQ3cGlrRG9MTytD?=
 =?utf-8?B?V3NCOXpRQnc1MTNWSEtEMzgvaWlyWVJXejJnSU5hY2NLYTMrTkkydEpkSmVp?=
 =?utf-8?B?aVdzQkRFamhlS05wakYwSE5yckZIZTZmOXYwYUhRSFBxWG4vNlVWVy9HcWRD?=
 =?utf-8?B?akhvUTBtaEc4MDhQUUF0c0JhdWV6T1A0dGRGbDhrZDlJTW10R1FNdWtBS1E3?=
 =?utf-8?B?SGREV0ttSnhFWGNkUElrbkpLQkcrWEVFZ1NLYlRDcWZYZ3lyYXg4cmtpeFUy?=
 =?utf-8?B?YUpUb2JEbW9GZERnZVZQMXRpWVFpaFRteE9FSlZIMnFhb3NVL3pZSVVvR1BO?=
 =?utf-8?B?QjJST3FaMjV0V3ZHdjdxc0pubnk3K05xcTBnWTFBZUtlRjd5aXo1U3pkVlNr?=
 =?utf-8?B?OE9OM1B0ais1RkJHUzZOOFdTNHJKMXVCT0NBSzFvbDJmZm1OR1krS3FISzdq?=
 =?utf-8?B?WUNqbHFaeXZ2SGl3S1hhaEFyWExBOWd1U2pNeUkydTFYTzZlcHUwakdVZyts?=
 =?utf-8?B?U3JlVHpOZFBxNjFlNmhJaUJpODdodm1CdzJGOXFGYkdWbXJnTUl1ZFo4WW41?=
 =?utf-8?B?UTV6MzhNVDRkekVsYjVRWFZBRFJtNmtVbzl2VUNaRGJsdDFjVDltTVRhUTc1?=
 =?utf-8?B?WHlPeDFEdFJZUTZRbmE2S2lUN0lJT0tWb21HdDl2UTRHRVQxZEUrSS9CbjJ4?=
 =?utf-8?B?S0R1UXpHM09DNHF4OXUxdndLMlU5S0VKNkYrT0RHdStHUHZWUXdnN0tTYzR0?=
 =?utf-8?B?eTdKc3FWajAwSExGTXcwcWRsWFRPMWJaWDlRc2pYMWgyQUlwaFNISlVtWmNi?=
 =?utf-8?B?WHhDVnZxZFo1SG5mcnhqYTE1aFhjVDZEbzNncGdja0J1bHBBM3pTNGFxZGR3?=
 =?utf-8?B?TldYMk9WZ0dDQjVTYndEWE1KdHhwa0VoRjFIeVNWRjVlNnNhN01ROEJVQzFF?=
 =?utf-8?Q?VDkukF70uGzK2tg1cegTldw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c85b306-7db3-4b72-3538-08db1e4f2e30
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3625.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 14:29:23.1874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JipBSRTZLn78dxMMYFOWRMJrYPYzXiKG8Ix086Mm/bS82vMEOrpo/xAO39K77rhY9zPmhLK2E6Pe1SQwY/tNkMd/ViGKYEOFhI0n9Qh2Ea0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8147
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat,  4 Mar 2023 22:15:16 +0000

> Octeon has a different cache interface with traditional R4K one,
> just opt-out this flag for octeon to avoid run R4K cache initialization
> code accidentally.
> 
> Also remove ISA level assumption for 4k cache.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/include/asm/cpu-features.h | 2 +-
>  arch/mips/kernel/cpu-probe.c         | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
> index c0983130a44c..c613426b0bfc 100644
> --- a/arch/mips/include/asm/cpu-features.h
> +++ b/arch/mips/include/asm/cpu-features.h
> @@ -118,7 +118,7 @@
>  #define cpu_has_3k_cache	__isa_lt_and_opt(1, MIPS_CPU_3K_CACHE)
>  #endif
>  #ifndef cpu_has_4k_cache
> -#define cpu_has_4k_cache	__isa_ge_or_opt(1, MIPS_CPU_4K_CACHE)
> +#define cpu_has_4k_cache	__opt(MIPS_CPU_4K_CACHE)

This breaks compile-time optimization for this feature => hurts
performance on non-Octeon machines. Could this be done some other way?
E.g. could this be defined depending on
CONFIG_SYS_HAS_CPU_OCTEON_WHATEVER? Via its own cpu-features.h or here,
that's the second question. So that the platforms which 100% can't have
this family of CPUs wouldn't get affected.


>  #endif
>  #ifndef cpu_has_octeon_cache
>  #define cpu_has_octeon_cache	0
> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> index 7ddf07f255f3..6d15a398d389 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -1602,6 +1602,8 @@ static inline void cpu_probe_broadcom(struct cpuinfo_mips *c, unsigned int cpu)
>  static inline void cpu_probe_cavium(struct cpuinfo_mips *c, unsigned int cpu)
>  {
>  	decode_configs(c);
> +	/* Octeon has different cache interface */
> +	c->options &= ~MIPS_CPU_4K_CACHE;
>  	switch (c->processor_id & PRID_IMP_MASK) {
>  	case PRID_IMP_CAVIUM_CN38XX:
>  	case PRID_IMP_CAVIUM_CN31XX:

Thanks,
Olek
