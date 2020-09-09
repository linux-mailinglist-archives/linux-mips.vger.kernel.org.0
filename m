Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C342D262D96
	for <lists+linux-mips@lfdr.de>; Wed,  9 Sep 2020 13:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728442AbgIILCV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Sep 2020 07:02:21 -0400
Received: from mail-bn8nam12on2082.outbound.protection.outlook.com ([40.107.237.82]:54880
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726415AbgIILBi (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 9 Sep 2020 07:01:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PsPJU/EylUUdg+cIXb1leRbku2YjitISxX34oNX5UB/WadUhK2wDlC2psoItE+FjT1JqIzCkVWfsB1luO8/Wha7KdFSlbl7bGgCe9hZ9nAn8D0IHJJq1k4y31EPVM9hzowhnVyQlAytKwDoHt8Yis9cBql1TWIUFTN7DUgWjfCsA4K751gD3l4EQ0WYBTakbajsSW9wXRtryiEn6vX1ieK+Vu3wo/RuwpNxQkm27Df1vJt4iPvo/k3iJwv2oxP7S06jdL+HPObCh0JTCV59wRZY2zIpB6npM4ny1HYN2PT9CoU4HFpSKFiebI8KKCzKK8PWaOsOoKuVu3EXbt2JzWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y5QbBVHSQC43Gl+6W5fw8HJT4W6DByEIYped23ejJjs=;
 b=JKf4WiWpytDYrLIm5rL7x4puLPAujmC5HWaH90s31TVI+yLo1Ff5QYIo25GZTbVsBBtH0UhKhBRpIWWZxagUFtlOsm2eTX93re+8sSiUAFnvtUEyyjyLuDutKqARB+JLGaZzk/HbpAe4krH47y/f5hdE4ioV+UK3+pUcGah0fQPmJ4PHi5806/cEEyeDH0SQ4deD+jPjChTON7Hq3JeU1M+IRYjRKrF1Bayrce07bMUdGKxwjfl2jJyEDT6RvaDZZMGb3eVZXEci1uCf5/TOyKstVQjDZrCK4PHR5nOB3kPgYQJ/VYP6HhCCnZ4NagUXK+7XNK4cmQD21/lyPfSRqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y5QbBVHSQC43Gl+6W5fw8HJT4W6DByEIYped23ejJjs=;
 b=2+K9YDffTzCqzSp5IzKogwtKQ8AryF14a5uWcFBFJSewcWk00In3CyZcnprnjzYyeOgEd3CBLMfpyX8ntj4+LE99ksuVW6rDtO5xroVpHRSH/D9bp22VeLoO+nvCkQjWyGxX9geDv87Tgc22s4ctGsfVKH4hWzobFR7hVd4qoWw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=none action=none
 header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4208.namprd12.prod.outlook.com (2603:10b6:208:1d0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Wed, 9 Sep
 2020 11:00:45 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3348.019; Wed, 9 Sep 2020
 11:00:45 +0000
Subject: Re: [PATCH 1/2] drm/radeon: Don't use WC for VRAM if
 !RADEON_GEM_GTT_WC
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Huacai Chen <chenhc@lemote.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        michel.daenzer@amd.com, amd-gfx@lists.freedesktop.org
References: <1599625320-17637-1-git-send-email-chenhc@lemote.com>
 <9fc515b9-bf6d-fa05-880f-1e0b473d1d19@loongson.cn>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <abcb547a-e43b-02f9-0a2f-5ff4373d0dc8@amd.com>
Date:   Wed, 9 Sep 2020 13:00:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <9fc515b9-bf6d-fa05-880f-1e0b473d1d19@loongson.cn>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR03CA0010.eurprd03.prod.outlook.com
 (2603:10a6:208:14::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7] (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by AM0PR03CA0010.eurprd03.prod.outlook.com (2603:10a6:208:14::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend Transport; Wed, 9 Sep 2020 11:00:43 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7696b4a5-ca56-4173-6f7f-08d854af99ed
X-MS-TrafficTypeDiagnostic: MN2PR12MB4208:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB42089A4995D581A0F0D4F7BE83260@MN2PR12MB4208.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 37x7hG0ODuaQYFp86EJBbUmuDuwtrb7H/rITjKLfHKKuTyvwIhemeCQ5CU5D+Lk59WtW43GZSbWsZyyOIT2HKRIveGgl7Wuo9RUZ/ELyK+MdgOBvCJ6SbdWSGuw1RkfIWrKEmryMU0shoe5mmEfWlc2U4oho4rqNIaNQ+BpJNpQFfQhaKPvu3pR1IFgd2XZJ7+KW1cQajqr017eJI2Ijpr8dXzMSvlQYzDW9eZbJ3VGgbLow9ntP3LhN3YupK9kz8VuGp9kHo31fVwRWEDTuyCKjyMIjjnSFVYz/QtADzT6/Q42L7pt2W8cu8Q55pX+zLJ7AhePkekiWNmvOZcVIbfUxh6z2w6ScrgP50royM/jzP9jWp3r7som0JHbHUUsC+niC3GgTYh/HjL3/vrWL49rmmPuM2hnnW/tVJAsuuq9dIgkEMO/KqIJBFHgt/4fa+JMPcB07Lb0ICoW0bSQhog==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(8676002)(2616005)(31696002)(8936002)(316002)(52116002)(4326008)(2906002)(110136005)(86362001)(54906003)(478600001)(966005)(7416002)(83380400001)(45080400002)(66946007)(66556008)(66476007)(6486002)(186003)(36756003)(53546011)(66574015)(31686004)(16526019)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: ztZwlFN/4dAxUuxsT6VEsaL8mkgTGPYba7YAo8qNYcSHJlZHQqiIBPaMuQTBH3VRxfHH9Jpx96KYt/ejTQXuj9ar+I534IQaOpocFg9C0+7dONl4Wk3lKj0Q03o3nC4k/UTWAG2un4ZYtNfW+/q8BCiW9uAZMeHoivcUn0AlCQSXakdyZXwKI5tH9aV4nlGAIVz40x0hvCoCCVb02EaQ61L1mZJ+MG7sbFKusCl6E3S+3MtleCQexsDIxZrbYtFeah261qEBFlw+rLr9+5MpgYo06N+Ib0DHmlrTtD1Pm+TO77op0aDWjnwQPxd3ZKpvFvzL+qFyt7nMWVNkCawqrIoh0fb3m/VVX/XCAak1uYdS1gMUwgb1kWLpnpgWHCxvoEzK/opEEeCgna063FVO4nm2kYAQJ1TUfhcNAziQoiHVEGncLalHwNwo6pIBYNpuw+Y/DaFo7W0Qt6cPfabRck4lzlvjPpzetTFVVJJsIs/Rj7V0MdkGKq1vzaX4lSdvOVRJOMA3VF1I60+Pl4+168le4hbpDR1OPhJNbMtERVNQeAu56N83mXg5GqibT/RYsYooryocZQ9fbxcVu5DM1YZi9itc8c29V15QuFvJUE7bch4aBVo1xYpdPTRBDBc0dwx9/fq3bMiZ2xAD/Avi0/RHH0LJbEOPCzn2PJekyhk8Cg+oHXIWwheRukS7jpc4Wfs6Ovb1yxY+IZADuU91dA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7696b4a5-ca56-4173-6f7f-08d854af99ed
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2020 11:00:45.4747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4zsQPEAiOSNq3FyC4zMljAbZy1LiofVzsHGOWV7Y8YEHDskTZShV7585LVsQM5pV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4208
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Am 09.09.20 um 11:39 schrieb Tiezhu Yang:
> On 09/09/2020 12:21 PM, Huacai Chen wrote:
>> Though RADEON_GEM_GTT_WC is initially used for GTT, but this flag is
>> bound to drm_arch_can_wc_memory(), and if arch doesn't support WC, then
>> VRAM should not use WC.
>
> +cc RADEON and AMDGPU DRM DRIVERS maintainer
> Alex Deucher <alexander.deucher@amd.com>
> Christian König <christian.koenig@amd.com>
> amd-gfx@lists.freedesktop.org
>
> Hi all,
>
> In the current code, if CONFIG_CPU_LOONGSON64 is set, 
> drm_arch_can_wc_memory()
> returns false, and then bo->flags clears the flag RADEON_GEM_GTT_WC, 
> so with
> this patch, TTM_PL_FLAG_WC of VRAM is removed on the Loongson platform,
> the writecombine issue for Loongson64 can be fixed [1].

And broken for mostly all other platforms. The patch is complete nonsense.

See the RADEON_GEM_GTT_WC flag means that that system memory can be 
mapped WC instead of cached, but here it is used to map MEMIO uncached 
instead of WC.

> I find this is done by commit 221004c66a58 ("drm: Loongson-3 doesn't 
> fully
> support wc memory"), but I want to know why drm_arch_can_wc_memory() 
> returns
> false for Loongson64, is there some historical reasons?

It looks like Loongson has a platform bug which prevents the PCIe 
extension which allows unsnooped system memory access to work correctly.

Regards,
Christian.

>
> include/drm/drm_cache.h
> static inline bool drm_arch_can_wc_memory(void)
> {
> #if defined(CONFIG_PPC) && !defined(CONFIG_NOT_COHERENT_CACHE)
>     return false;
> #elif defined(CONFIG_MIPS) && defined(CONFIG_CPU_LOONGSON64)
>     return false;
> #elif defined(CONFIG_ARM) || defined(CONFIG_ARM64)
> ...
> }
>
> drivers/gpu/drm/radeon/radeon_object.c
> int radeon_bo_create()
> {
> ...
>     if (!drm_arch_can_wc_memory())
>         bo->flags &= ~RADEON_GEM_GTT_WC;
> ...
> }
>
> [1] 
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fpatchwork%2Fpatch%2F1285542%2F&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7Ca60b0da3c62448f4b5fe08d854a43420%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637352411519749179&amp;sdata=kiXLj58%2Boma5r5EYRuEsLg%2FwqkXpHtBfxLWVUgC%2B2g0%3D&amp;reserved=0
> gpu/drm: Remove TTM_PL_FLAG_WC of VRAM to fix writecombine issue for 
> Loongson64
> [2] 
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Fcommit%2F%3Fid%3D221004c66a58&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7Ca60b0da3c62448f4b5fe08d854a43420%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637352411519749179&amp;sdata=ekNulVe555%2BVnnsqSx5N0wwH%2BepaBGfzBHQnxddbO5Y%3D&amp;reserved=0
>
> Thanks,
> Tiezhu
>
>>
>> Signed-off-by: Huacai Chen <chenhc@lemote.com>
>> ---
>>   drivers/gpu/drm/radeon/radeon_object.c | 14 ++++++++++----
>>   1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/radeon/radeon_object.c 
>> b/drivers/gpu/drm/radeon/radeon_object.c
>> index f3dee01..07b82d9 100644
>> --- a/drivers/gpu/drm/radeon/radeon_object.c
>> +++ b/drivers/gpu/drm/radeon/radeon_object.c
>> @@ -117,10 +117,16 @@ void radeon_ttm_placement_from_domain(struct 
>> radeon_bo *rbo, u32 domain)
>>                                TTM_PL_FLAG_VRAM;
>>           }
>>   -        rbo->placements[c].fpfn = 0;
>> -        rbo->placements[c++].flags = TTM_PL_FLAG_WC |
>> -                         TTM_PL_FLAG_UNCACHED |
>> -                         TTM_PL_FLAG_VRAM;
>> +        if (rbo->flags & RADEON_GEM_GTT_WC) {
>> +            rbo->placements[c].fpfn = 0;
>> +            rbo->placements[c++].flags = TTM_PL_FLAG_WC |
>> +                             TTM_PL_FLAG_UNCACHED |
>> +                             TTM_PL_FLAG_VRAM;
>> +        } else {
>> +            rbo->placements[c].fpfn = 0;
>> +            rbo->placements[c++].flags = TTM_PL_FLAG_UNCACHED |
>> +                             TTM_PL_FLAG_VRAM;
>> +        }
>>       }
>>         if (domain & RADEON_GEM_DOMAIN_GTT) {
>

