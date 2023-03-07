Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C665B6AE76B
	for <lists+linux-mips@lfdr.de>; Tue,  7 Mar 2023 17:56:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbjCGQ4p (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 Mar 2023 11:56:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbjCGQ4W (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 Mar 2023 11:56:22 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DB0E8A73
        for <linux-mips@vger.kernel.org>; Tue,  7 Mar 2023 08:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678207945; x=1709743945;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5n+/v8SNl0Z5r2X+0NBwwF5/RfTeR6cMHY0PfJzpSQw=;
  b=TIe60AV9JaLyEXROTxiT3A6mjpgZG5TXkRlH2p8RPZHtpTy6hsYn5U3+
   Z9gS6mK0svU+0ZyDOjxHGsIb+eByaTVUKAMOiX7KcQpspbvL3gJXpUzBG
   IXJWTqhIPqfzTgtkVpztS3hGTOqsouWRjoK+17U+8RAkyO2nug7g7WLA5
   5X2jqNE0yCHI/y0XJYXwSR7Khn5N/WPXuxkqHpfOgaKoZUOvAmsGmZGN3
   VxHi69SiERXS0Bs3UE9dPSa20JrmR739ALMsL8QB0AXt0aO4h6F5KEsrH
   6cfeTeLFh2PPyHXxlFAVNfbCG3xPARfH6sYxPYCp4/fLZX339WK7zDg/5
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="324211572"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="324211572"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 08:52:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="1005945429"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="1005945429"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga005.fm.intel.com with ESMTP; 07 Mar 2023 08:52:24 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 08:52:24 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 08:52:23 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 7 Mar 2023 08:52:23 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 7 Mar 2023 08:52:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hNBtCfE2X4araJV4J5iEJVp9XHNzRTnBBjQGiuyyj+wPbfakxerBaX/cvZKrVwzh743fGyhJaa2yDF/QcJ5FgNpNLwiKBABctFRAyG1pHZPC1xW/Ming03lNQ6cGz7ou5NrtQCMuwGk1hqQN9Vk3l3psYjMqkPAt/kBinatKHTcz+d+ftN64drqJFWqcFgB8BnTnXIc2L3gTzmPq/UYKVBsyM0TIkDoCrDHXsNu2ptsm4L1cHVLN3ogtfPvQJoYQqiYf+JyCEHTiOkGg5lcTohU4d8dTRanM+UhY6gfOznruJfkxTRm20uM8uOz3fBJx61RwaUeIbm4r4KCCKhIDcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1sfyOrAXIPVKkWoOHKT2j5wL4oUtRVt2JI0d6gJPBfs=;
 b=ik8Y7SB1depHY8cadHXX24DfNNIQSKV39fG6xvup4/GFFoYr8/3YhmLxaKepxFPXJeeMa27rf977sI5f4IWthoZKYA2lws/b/Qyh08r4DWZonVnDNowhVnlxxEYNm8vGlyA8Qbz1Zmw7TDDGxw27CiRAv0ZoxvYUKmELm9U9rwAcD4SP6Px8hYis/Fw+tWHpQQXvyxAqqd3Z1BTO0y+HRBNVlg4Dv/J2HNTx3QIdBW8pAMeyDg60zGyS9cMe9gLDTaG/z3EpY5LPTOmGgJ7wuVzkHeavt0pVOFIMPHRVwHPolXYRTcSnVMa2C8QSc0ub9AK4+ceL4dHmsZnRnzowZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3625.namprd11.prod.outlook.com (2603:10b6:5:13a::21)
 by MW4PR11MB6837.namprd11.prod.outlook.com (2603:10b6:303:221::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 16:52:22 +0000
Received: from DM6PR11MB3625.namprd11.prod.outlook.com
 ([fe80::3ff6:ca60:f9fe:6934]) by DM6PR11MB3625.namprd11.prod.outlook.com
 ([fe80::3ff6:ca60:f9fe:6934%4]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 16:52:22 +0000
Message-ID: <748e9714-b245-9d61-7c28-fd38c726b9a6@intel.com>
Date:   Tue, 7 Mar 2023 17:51:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 04/12] MIPS: Octeon: Opt-out 4k_cache feature
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230304221524.47160-1-jiaxun.yang@flygoat.com>
 <20230304221524.47160-5-jiaxun.yang@flygoat.com>
 <b09d488f-ba4c-dba3-e2ee-87b5660dbdda@intel.com>
 <A09E74C0-BA5A-4BAA-B6DD-74109090A153@flygoat.com>
Content-Language: en-US
From:   Alexander Lobakin <aleksander.lobakin@intel.com>
In-Reply-To: <A09E74C0-BA5A-4BAA-B6DD-74109090A153@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::7) To DM6PR11MB3625.namprd11.prod.outlook.com
 (2603:10b6:5:13a::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3625:EE_|MW4PR11MB6837:EE_
X-MS-Office365-Filtering-Correlation-Id: d854d8bf-e888-4e16-6acc-08db1f2c51d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o6f+UvaVqVyN9mEkaeCeBLGMK0Vv7va6z72qRp/QQ2Vl9x9/XYilcqnvYvf2Omo1umIwMvCL2DVJbYqGihcylpN2+zu/IeexYKuCsdRdPFk5C5wkLi17KBRZGRhOTl8rBC7YBaNg/gb84z99MZfMjh9blyG9ZXuSfgCa9mcmvMGWInNguqMeLIlXY2z5j5qgTMvx0OpxfBuflbFWWoACPVrND070NX1EwJXOG66XB+83i8XhBMbZF569GSRHacDGYLqMxk9pyDNxPaX4VB5QSteQk7G2bTRLLssog6DrtrAzWzsiSSJNQNRvIkZg7uTPkAXsSgSkaOTSGXqtp1bjFr2XeQZxZuZ6v0TB+Bg71Us6tNZ5QzMOqVydwy81pzz4ZNdyNRL92hxL8JhkwIqEjKLIhdUciFYTl7CxcXJVSRgaO+WEsmtQs4LFhWknmBkUtHYHa1EE9M1jkvpmnrk5jfbTiga493JlqBGl0TWApkGQwH4zTpmm/BfOnflrKlwrWZiLlpRuJ2/SOD5bunD5tGDr+nL7c+762e+vy20x1VcH4uWZ/FlFpykM25AsnTlafZXv/lTh7svMqWA024YeAA8baxPhqTsu5wcmbPpaPEkZE2AE6y51otnBVEbuHiODGMt7+IABaaipL7pnu1VV0+K3JneWT6aIP/+P9jXR6e8l+B88oBxNQBI6ybFKeDpPMBE4UKrjzHK5QyIUBsuOxx+NWk2t8sG9UjCGncwdofc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3625.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(396003)(39860400002)(346002)(376002)(366004)(451199018)(316002)(4326008)(31686004)(82960400001)(41300700001)(6916009)(8676002)(66946007)(66476007)(66556008)(54906003)(38100700002)(8936002)(5660300002)(478600001)(2906002)(6486002)(36756003)(6506007)(6666004)(6512007)(83380400001)(26005)(186003)(2616005)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEtPdXk3T3BqblExRHBEN3NsNTJRTTdPTExHMGtPZmRyRHRjV1F4TUowWU1t?=
 =?utf-8?B?U3J2VFROem1LWERiYTZUaGMveC9QRmxXSG1YUGY5eGRqb1hqZ2xJMDRZRDBq?=
 =?utf-8?B?SHFxSXRjN2M2ZlJyc0M3cE56NU82QWlYT3VHZFVGVkJOaFY0MUtpZkdPWkEy?=
 =?utf-8?B?WjZCeTh5UFllZUdBaTQveUhYK2RGMkQ0cGFLcGZPaC9FZDVuMVFlQUJDZ3Vr?=
 =?utf-8?B?NjVXckZ2bFFFbVBtV3F2OUJyV3NvOVpyY2R6Z25GYXRZR25TWW1nMGN4QmRm?=
 =?utf-8?B?Q3VxciswRGZFK01IekRkRWVKbEFUb0tzRG1kc2pRNHBOUnBwZFNLSGMzbXN5?=
 =?utf-8?B?alpKdTY4ckZDMzdwTDNGaTJxNTJUa1A3TnNYOUF3WE9seXk4aC94M0tVbDVL?=
 =?utf-8?B?dHhBT2ZFRzhiOEVpQnBBWi9SOWpERmdERjc5b3kzbU1qZzVVSGNqaXRtVSsx?=
 =?utf-8?B?RVhpNldQY0VoekRVV0FiZUI5dldWSjlET0xYUkJIeGF0TkhWTXZSMFY1NXV1?=
 =?utf-8?B?RmRIeWQ3WGI2eTFVb3U3dVpjZllWN0FRcDdZK2dEaUlWaExNMHM1VW10K2FR?=
 =?utf-8?B?WDFWQ3FSRGhKdUI0T2RYNzRBZjZWM0pGLzM0R0ZtbUVRMXpHZkhzNUhSRkcr?=
 =?utf-8?B?Z3BENmk0czR0SDV4dFFrSlZYUUllRHByVE41SVIvMmo2Q2xpejluQmpObytp?=
 =?utf-8?B?MnF6VnZQdHgxYlJJUE02bHlSKzBOeC9Ydy9nTkFyckx4MjdLa2F4YTVWTzBr?=
 =?utf-8?B?QjBDTkFCcWNzWUJFeGVPVlpHbGY5RVNHcndEWURLY1BiOC9KdG1UWXdsY0JO?=
 =?utf-8?B?T1VWVnRMb0czSktMaTUwWW5LSTFFb3Vzd2ZZZmNRVlM3cW5hRFhzMDhmOWxV?=
 =?utf-8?B?TUV5WUdHZ244NVdSRTVZUDFia29na3Vyb2NHME1oZ1c5TzNLbjNBMEZsRk5V?=
 =?utf-8?B?K2YxT3JteEtSYnNFU1FoWlBnVXJjSERiYm8weVU2VU51bFQ1UmM0ZzJncjZG?=
 =?utf-8?B?Ni9MVnBJelU4NTY5cGE2RGxjRjJ2TXl3cEFISmNDTzB6STd3MGtveUEzMGZh?=
 =?utf-8?B?YUJQQ2VjUFVjWDA0YUlPUitLSWJIYW13K0xIZGk4M2RDVVNKVjJEV3d2NnR3?=
 =?utf-8?B?Nmppd0JlS3NlemRHenhzTFV5cVFlNkF5djFab3FSQVNuVUN2UWFaRHlwUjdx?=
 =?utf-8?B?MEFLRTJ1MUVYcThaL21UdDFQekZvT3hWdjVYMHNOcGlxcjNhVHp3QjhYdkxB?=
 =?utf-8?B?WFVVSGVtVlRtZGJVWi9rZVFmckxNWkY2aDFCYStDNGJ6endQT2RUdE9Zd0lH?=
 =?utf-8?B?R2pYSEpZd2pYckdWODcrL2NYT1Mvb1lnRHZpY0dkVk4rdDA2UGVMYWhuU2hN?=
 =?utf-8?B?SjJmRFpBTmE0Y29pRi8xNTF0cVMrMlByNWpMR0FzSlVsc1BHQUMvY3VEV0Zp?=
 =?utf-8?B?eWJBWWpmVXZZNi9PVkVHNXRBb1ZGZ1FBTm1KSjcxcGtOd2doOUNDRTU5Qlpn?=
 =?utf-8?B?NTU4bzYyVUZhMTNSak1RUkkxVkVQU3QyajA2RVFhZGhJeEVoWHlwL0M5a3hU?=
 =?utf-8?B?c29EMm9rRWtDMUllUWxJUGZRMjlWNWNxWHlFYTNsL05FV3ZnT04za3AyYk1I?=
 =?utf-8?B?dG1rNVNmVzNZejlSMVkvVU15eFJtSnlBdS9pVnRxeUhBRFZKN2M3aFN5VUpr?=
 =?utf-8?B?RjhFaVhua1QrZ3JwbGJKWXNtN1FUZ0JNTmRMMHpiaG1aRkdsUSt3Ym9aQzg0?=
 =?utf-8?B?V09CWVJpSFFNNlhyNzlFcGsxN0hlT1Y1cnVERS9ta1Rxa2I0M20xWlJDVGwx?=
 =?utf-8?B?WmpWb1BhNGppdHJiRjlVeUF0WEFqNDJzbTQxN2pzQkVQSkZEbjdkbjFzY0NW?=
 =?utf-8?B?UVhlTGF4eVZjUVFaMDgxNGFsUEY2YnJuQmZsb1RycjRFYzEya01HUVZCUVhW?=
 =?utf-8?B?bHNCSDcwYVM0cU11SmpjKzZQUUxoNHFBRlRKMmxJS2NKRDNBenhjS3RaYU5Q?=
 =?utf-8?B?T2JBTTdNaGdwVDJTSXg5YmU3RFlLQlZySUVYLzFFVjhXNFhPZm9rMkRRRXNt?=
 =?utf-8?B?eWR6a29Vc3hYS2RESnFIdEdRMnNvbUljUGlHN01uRDVVaU1PNVFjWjF0d1dY?=
 =?utf-8?B?ZFM2U0FudW1rS3VVT0t2YTRuaGVBb21NMkswS3dLc1g2Q3dPZmZmRHRGL3d1?=
 =?utf-8?Q?N8W18J7nblydCfkUkeey9y8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d854d8bf-e888-4e16-6acc-08db1f2c51d1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3625.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 16:52:21.8351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /h1z37mpEvtmDsVjNJpNV/ee5ony3FAeQmEQpIUNRmVHjpszmxvcQAEabvtO9PsfoSgCHe1uAwjJZToKQpwFBKwkF9WfFSH9ATWzJbDdlq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6837
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Mon, 6 Mar 2023 19:55:23 +0000

> 
> 
>> 2023年3月6日 14:28，Alexander Lobakin <aleksander.lobakin@intel.com> 写道：
>>
>> From: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> Date: Sat,  4 Mar 2023 22:15:16 +0000
>>
>>> Octeon has a different cache interface with traditional R4K one,
>>> just opt-out this flag for octeon to avoid run R4K cache initialization
>>> code accidentally.
>>>
>>> Also remove ISA level assumption for 4k cache.
>>>
>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>> ---
>>> arch/mips/include/asm/cpu-features.h | 2 +-
>>> arch/mips/kernel/cpu-probe.c         | 2 ++
>>> 2 files changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
>>> index c0983130a44c..c613426b0bfc 100644
>>> --- a/arch/mips/include/asm/cpu-features.h
>>> +++ b/arch/mips/include/asm/cpu-features.h
>>> @@ -118,7 +118,7 @@
>>> #define cpu_has_3k_cache __isa_lt_and_opt(1, MIPS_CPU_3K_CACHE)
>>> #endif
>>> #ifndef cpu_has_4k_cache
>>> -#define cpu_has_4k_cache __isa_ge_or_opt(1, MIPS_CPU_4K_CACHE)
>>> +#define cpu_has_4k_cache __opt(MIPS_CPU_4K_CACHE)
>>
>> This breaks compile-time optimization for this feature => hurts
>> performance on non-Octeon machines. Could this be done some other way?
>> E.g. could this be defined depending on
>> CONFIG_SYS_HAS_CPU_OCTEON_WHATEVER? Via its own cpu-features.h or here,
>> that's the second question. So that the platforms which 100% can't have
>> this family of CPUs wouldn't get affected.
> 
> Thanks for the comment.
> 
> This feature is only checked once during boot and never checked at runtime so I think impact
> should be negligible.

Ah, didn't notice it's not used anywhere on hotpath. Just forgot that
MIPS installs cache sync callbacks once at boot and then use them.

> 
> Just don’t want to have another ifdef here :-)

I'm not sure one ifdef would hurt, we probably need a third opinion here
:D Maybe Thomas'. But I'm fine with the current implementation.

> 
> 
> Thanks
> - Jiaxun

Thanks,
Olek
