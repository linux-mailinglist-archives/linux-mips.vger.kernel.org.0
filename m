Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B9601A0E49
	for <lists+linux-mips@lfdr.de>; Tue,  7 Apr 2020 15:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728306AbgDGNZm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 Apr 2020 09:25:42 -0400
Received: from mail-co1nam11on2044.outbound.protection.outlook.com ([40.107.220.44]:6197
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726562AbgDGNZm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 7 Apr 2020 09:25:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmhVMwlcpOTYq76sIkDAx+/QAJCjuWANmx5s1CIYiRtQ/HQbCRqifIU32ABB+LQ2vqgS1fZlQTSkE/r3fohIzvBdJ/qlbQYRnr4jUmrBta9kXgM0kBYJJAEXlfDRGoWk/nN20OGyg+weM2aHMvbBMRs2gqgdd6os4dt+dAmiYuceFX8ut8EzAQlR/rxR2aQrULh1vCVLjVEG2gBuKH3xjVPBmfHOIhFlrCjClKaP7Po903Koj5+XSXC5rTu6djyXLbUx8ocNtfFQsyZafnjQNuNzl/uo+1O22jzqm1Nu3CBUScBauJf/sBkmXVbxC1iKihTRwntxw6ijoqdfUGWeBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIqopmkJ1UGFm7MMPjAhCTwCYNl9hDHm++lnvE33PGw=;
 b=G3pvemVDnoZHbeN5dVBLIxsiI4WgNxx1+K38KEIaja+bLzFBS64A2n8ARjdqDwmVqaDwbsGqbgVyzTJgMz+e24ZkJLAIUl1q/hLzRpEn/U9zs3DMtebiPjG18Lu0ndMiiTAiacbg68Viiv445Rqf/nDEoDLnFV6864uMXeQtdyHBRhlJghyWrEyl/jK11jGK6GYQUQkiT9wxOTQufBagEC/5DSr8SkY+KieolvFSKuDgUage6L3hSkKCErWSJ87/Dj2nU4PzeRcujJcpcvUaSKPNwOh8Gy654L3KbexoquNA/z6kIfn0u4UN5NrmABbrmIwNs9ipHp/72XpE95hFAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIqopmkJ1UGFm7MMPjAhCTwCYNl9hDHm++lnvE33PGw=;
 b=bbqkbubw2EgCffiX1YPVz5zOCd2EFTga8UGhqkqp8xh1dZBn6BVRHCyO/nMS0NI4ZIpEvuVeBK00EBY0tkINdLSy+Y10O57SgzzXG9gDzxZQRd9Xy0De8zLGccM67POnteiSxRV3vjcBMz/JEKoWe8oFcIy6g8iF5Q7hJXV8AjI=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yanfei.Xu@windriver.com; 
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by BY5PR11MB3879.namprd11.prod.outlook.com (2603:10b6:a03:18f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.19; Tue, 7 Apr
 2020 13:25:03 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::80a8:667c:426b:6917]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::80a8:667c:426b:6917%7]) with mapi id 15.20.2878.018; Tue, 7 Apr 2020
 13:25:03 +0000
Subject: Re: BUG: mips: errors when compiling kernel with a large initramfs
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <0c1e4eda-53c6-ea8b-c27b-eabc8569cc74@windriver.com>
 <20200407202519.4d384f3b@flygoat-x1e>
From:   "Xu, Yanfei" <yanfei.xu@windriver.com>
Message-ID: <c53b92f1-02e2-7beb-310b-f9a15eb5434a@windriver.com>
Date:   Tue, 7 Apr 2020 21:24:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
In-Reply-To: <20200407202519.4d384f3b@flygoat-x1e>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: HKAPR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:203:d0::26) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.160] (60.247.85.82) by HKAPR04CA0016.apcprd04.prod.outlook.com (2603:1096:203:d0::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.17 via Frontend Transport; Tue, 7 Apr 2020 13:25:01 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3ee4cf6-de38-430e-d520-08d7daf71437
X-MS-TrafficTypeDiagnostic: BY5PR11MB3879:
X-Microsoft-Antispam-PRVS: <BY5PR11MB3879F2F864B6B5D02C1F7C49E4C30@BY5PR11MB3879.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 036614DD9C
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(39850400004)(346002)(366004)(376002)(396003)(136003)(2616005)(2906002)(31696002)(36756003)(956004)(5660300002)(66476007)(81166006)(66556008)(6706004)(66946007)(81156014)(86362001)(8936002)(8676002)(6916009)(6486002)(6666004)(478600001)(316002)(186003)(4326008)(16526019)(53546011)(31686004)(26005)(16576012)(52116002)(78286006);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: windriver.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UQMMLF/AEhQflInUA5g2J612c+Z0ycLisCFpD5+8NsjLFivvdVpKrb55tkV9nU1lbjO3H//8wZU9My4lWXcU9zYw7NSUfOzyXG9kAyNf04G7QvRPp/S9ApOEwD/uGAaUEO3SUQsapuTwmWpqQu/s+b6saw8LxKkBw2KMVht4q0rKRgw4Z6mksgo3zkA0jrf9IQ35zCSynsUGPp+AjmNsvuhdy/mUXmvME2GIMccUijf74Vd/uK3gGkHB/PND7wtk4j4mAI2mKMzIxdgiEgNDm5SOr7iUBfl71M/xBK3gbqgCEZ7ltAuvmkg553a6auW1+9rvWEGUi6HbwV7SXFKVuC1SwyvydEPxCwXJXr5y/jFAyee8+T8eQ1NN2ub7Bna4Wn4CVSAJgW7G9V5xffGgfYx8Ct2/rb0hXSPUSniiPf9j3agCnMKDLcFl9FKdA9OYUjhcyyJUx7VZ2xBZJNKV0bWUieByF8z2IsiHC+MPDbHvKc8gA7nIq+L8Vjuf3s4n6tgKfptLOyErURJ4Ou6o1mYPQZhNoZJqQ0dI2BFLsDs=
X-MS-Exchange-AntiSpam-MessageData: Rc6nA2FhYxcfifiRKRA1twYqLQwMffz+Gw2tVZBf0sMwrRGMz088ODXU7yb51Kj86ErBzRvN6UhJuf+e4YUe/THkro8QKJYpJ9pvPpMY5OMOjfhjmMk8vDG6H+SCgqvcLgtIqVwOnBjPOly1dB9ltg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3ee4cf6-de38-430e-d520-08d7daf71437
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2020 13:25:02.9873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Xtrp5k3CStBY1oJeoqmSfYCQQA9uxTHwIW13Q1G5wlmTpP/jr9DgN6jMKNL0QqI4WtgenoGfrEvaD90sgjDsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3879
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 4/7/20 8:25 PM, Jiaxun Yang wrote:
> On Tue, 7 Apr 2020 17:58:23 +0800
> "Xu, Yanfei" <yanfei.xu@windriver.com> wrote:
>
>> Hi,
>>
>>
>> It fails to compile mips kernel with large initramfs (at link time).
>>
>> kernel version: 5.6.0
>>
>>
>> Steps to reproduce:
>>
>> 1. git clone mainline kernel
>>
>> 2. set ARCH=mips and CROSS_COMPILE=mips-linux-gnu-
>>
>> 3. make defconfig
>>
>> 4.enable initramfs support and set the path about initramfs source
>> file
>>
>> 5.make -j24
>>
>> [KEY] when your initramfs files is too large, and cause
>> usr/initramfs_data.cpio.gz
>>
>> compiled is larger than 225M, you will get the following error. BTW,
>> x86 doesn't
>>
>> have this issue that I have tested.
>>
>> ------------------------------error
>> messages-----------------------------------------
>>
>>     CHK     include/generated/compile.h
>>     LD      vmlinux.o
>>     MODPOST vmlinux.o
>>     MODINFO modules.builtin.modinfo
>>     GEN     modules.builtin
>>     LD      .tmp_vmlinux.kallsyms1
>> kernel/configs.o: In function `ikconfig_cleanup':
>> /home/wrsadmin/work/linux/kernel/linux-master/kernel/configs.c:72:(.exit.text+0x8):
>> relocation truncated to fit: R_MIPS_26 against `remove_proc_entry'
>> fs/binfmt_script.o: In function `exit_script_binfmt':
>> /home/wrsadmin/work/linux/kernel/linux-master/fs/binfmt_script.c:165:(.exit.text+0x4):
>> relocation truncated to fit: R_MIPS_26 against `unregister_binfmt'
>> fs/binfmt_elf.o: In function `exit_elf_binfmt':
>> /home/wrsadmin/work/linux/kernel/linux-master/fs/binfmt_elf.c:2393:(.exit.text+0x4):
>> relocation truncated to fit: R_MIPS_26 against `unregister_binfmt'
>> fs/mbcache.o: In function `mbcache_exit':
>> /home/wrsadmin/work/linux/kernel/linux-master/fs/mbcache.c:429:(.exit.text+0x4):
>> relocation truncated to fit: R_MIPS_26 against `kmem_cache_destroy'
>> fs/nfs_common/grace.o: In function `exit_grace':
>> /home/wrsadmin/work/linux/kernel/linux-master/fs/nfs_common/grace.c:133:(.exit.text+0x4):
>> relocation truncated to fit: R_MIPS_26 against
>> `unregister_pernet_subsys' fs/ext4/super.o: In function
>> `ext4_destroy_lazyinit_thread':
>> /home/wrsadmin/work/linux/kernel/linux-master/fs/ext4/super.c:3456:(.exit.text+0x24):
>> relocation truncated to fit: R_MIPS_26 against `kthread_stop'
>> fs/ext4/super.o: In function `unregister_as_ext2':
>> /home/wrsadmin/work/linux/kernel/linux-master/fs/ext4/super.c:6126:(.exit.text+0x30):
>> relocation truncated to fit: R_MIPS_26 against
>> `unregister_filesystem' fs/ext4/super.o: In function
>> `unregister_as_ext3':
>> /home/wrsadmin/work/linux/kernel/linux-master/fs/ext4/super.c:6155:(.exit.text+0x3c):
>> relocation truncated to fit: R_MIPS_26 against
>> `unregister_filesystem' fs/ext4/super.o: In function `ext4_exit_fs':
>> /home/wrsadmin/work/linux/kernel/linux-master/fs/ext4/super.c:6261:(.exit.text+0x48):
>> relocation truncated to fit: R_MIPS_26 against
>> `unregister_filesystem' fs/ext4/super.o: In function
>> `destroy_inodecache':
>> /home/wrsadmin/work/linux/kernel/linux-master/fs/ext4/super.c:1218:(.exit.text+0x50):
>> relocation truncated to fit: R_MIPS_26 against `rcu_barrier'
>> /home/wrsadmin/work/linux/kernel/linux-master/fs/ext4/super.c:1219:(.exit.text+0x5c):
>> additional relocation overflows omitted from the output
>> Makefile:1086: recipe for target 'vmlinux' failed make[1]: ***
>> [vmlinux] Error 1 Makefile:1058: recipe for target
>> 'autoksyms_recursive' failed make: *** [autoksyms_recursive] Error 2
>>
>>
>> Any comment will be appreciated.
> Actually I think that won't work even if you managed to workaround
> reloc issue.
>
> MIPS have limited LOW MEM range accessible via KSEG0 (512M, but can be
> less if your system place some MMIO register in that range). Kernel
> image will be placed here together with built-in initramfs, and a
> lot of memory like Page Table can only be allocated from here.
>
> Such a huge initrd will occupy the whole LOW MEM range leaving no space
> for others.

As you said, it is really a problem about a huge initramfs. I'll pay 
attention

about this point.

> It seems like your system is 32bit, we have no solution for that
> hardware limitaion. For 64bit system you may try to move your kernel
> into XKPHYS instead of KSEG0.

Yes, it is a 32bit system. And thanks for your workaround about 64bit.

: )

Thanks,

Yanfei

>
> Thanks
>
> --
> Jiaxun Yang
>
>> Thanks,
>>
>> Yanfei
>>
>
