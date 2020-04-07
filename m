Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 276731A0DFE
	for <lists+linux-mips@lfdr.de>; Tue,  7 Apr 2020 14:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728624AbgDGMy3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 Apr 2020 08:54:29 -0400
Received: from mail-dm6nam10on2086.outbound.protection.outlook.com ([40.107.93.86]:18507
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728146AbgDGMy3 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 7 Apr 2020 08:54:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TtuDhJ4tR3e6LAfKacnc8KD3eYOHpQzZ81G8mllx5sProZDbErwErCfRXUXmAHmzH4dznebR9vpsFwAp+oWTSatc3eGi2B0+gZOSs63GK+BNxIywvACi4pWq8O78Tuj5c4O99e+R/NGoeiL1ah06CgGF7fm9/JET/16WXdJO1NvtcxYGwJUoIXaHghYGQLDc6/eQtFZ3OlvnHwLBxcP4Seydho3QlExEDC/ywGQ4MlDeorFHbd/XyshcS/JDDk3uGEycfyKznl5qk8Qgs9eSDYIs/Fv0tRXpX9lFjhyxHoaxkCqULBwXAtIIXggRd0ZD3Z/bnLOZHb620Q67ubV92w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCpCxxkye4N7BwzqdrgwGTgc/evzCPIruE+rwaBIGlA=;
 b=WB5KY+OSefD3ATicrjSqieom5LS7mlaU48zvp3nFsBvyqECUyKhp1T5ddEks+30Ewfns212cKvr4YWjHzx6LNyGe57ePLZS1J6tcEJM0elUZbKIWy0vMNlGRQHobHHcZ5ecGw6vr3X8+0UqJ7AfXv2V8CHTzRSro2BFXL5T6FzWdNwElaLKbzosMMPJtKb/B79ufAHyFxSZ8toJQhLt8cpFdEwM6HT5TRrbmAb4mfuMjQmspC7RUTJF/MZ57M9+dUSCrpqEI/+2+AWu5JucUNU2pb7aCwKDNxKZAfvb57lE4o0dR2pk8FtlZO9m7Aet635CNMYUChVq6OxvYxQwRGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCpCxxkye4N7BwzqdrgwGTgc/evzCPIruE+rwaBIGlA=;
 b=df5jxGlIvxD2f6rTdwejbvjhFhPNpbvwZU1VZibo4nVcOCgSH1+ni1jP91m4WltB0cM0JQsuGWYw4m9A0/+muHWpsrsYUX1Y3wHhmfVJBndPw9Q5g7uFIYSLFdjDyboba7kDeTX5p4649S0lFTt8D5DJJW2DAOPAmkx92xAWbkI=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yanfei.Xu@windriver.com; 
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by BY5PR11MB4212.namprd11.prod.outlook.com (2603:10b6:a03:1cb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.20; Tue, 7 Apr
 2020 12:54:25 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::80a8:667c:426b:6917]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::80a8:667c:426b:6917%7]) with mapi id 15.20.2878.018; Tue, 7 Apr 2020
 12:54:25 +0000
Subject: Re: BUG: mips: errors when compiling kernel with a large initramfs
To:     YunQiang Su <wzssyqa@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <0c1e4eda-53c6-ea8b-c27b-eabc8569cc74@windriver.com>
 <CAKcpw6XtUDLOPfdCxJzdSfsEeJyuoNZ9Wo0ydmTGfckLkuKbiA@mail.gmail.com>
From:   "Xu, Yanfei" <yanfei.xu@windriver.com>
Message-ID: <9c732d5c-df85-96b4-3bd4-0886169817ab@windriver.com>
Date:   Tue, 7 Apr 2020 20:54:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
In-Reply-To: <CAKcpw6XtUDLOPfdCxJzdSfsEeJyuoNZ9Wo0ydmTGfckLkuKbiA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: HK2PR02CA0219.apcprd02.prod.outlook.com
 (2603:1096:201:20::31) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.160] (60.247.85.82) by HK2PR02CA0219.apcprd02.prod.outlook.com (2603:1096:201:20::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16 via Frontend Transport; Tue, 7 Apr 2020 12:54:23 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88d77569-9e23-4683-748c-08d7daf2ccf0
X-MS-TrafficTypeDiagnostic: BY5PR11MB4212:
X-Microsoft-Antispam-PRVS: <BY5PR11MB4212A0CF67C00399F23C68B9E4C30@BY5PR11MB4212.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-Forefront-PRVS: 036614DD9C
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(346002)(136003)(39850400004)(376002)(396003)(366004)(81166006)(6706004)(86362001)(5660300002)(81156014)(66476007)(66556008)(6666004)(66946007)(966005)(53546011)(31696002)(6916009)(6486002)(52116002)(8936002)(4326008)(26005)(16576012)(478600001)(31686004)(2906002)(2616005)(36756003)(8676002)(316002)(956004)(16526019)(186003)(54906003)(78286006);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: windriver.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i7JGHnYjyP2AwmO37FLDXqqyEn3BH6zDezqVhwLTy0Pj5AZ25o8wqugiJI5zU4tXUge1/R8sEXIUe0726RxHlhrcejaAxtRQ/TEobHrDbMbRQVz07ba0hQ533G3uaSKpL+2VofuXJHoeifudJ5VQB4sn7e+WMjfDgrGkmPFYDA7Ih62Es1I8laXqzKEf3Cv+N6i2CSI0QQfI8qRBM7ozgxBpK7FtTdzORA0LD8p+53BjGSmuwir9brb8JRMe7rVs4vU/yrvaFxGZKk+5JFvN+2RBMD762cTTj2c91ya29oprLLdI06zDNJUejV3NbYKE2t0gnGGQFNjU7ZWo+f0PZm/ocTNRxEDQlF5Hb2j1LXr23fuQKlfuESu5mtr9/MAXvV3CJeJewhxNxs1gk4hYVwfWamVVGiTnn0B4IrtJvbcxkwfds3PfkR56bcdczdsmpyLgsapX5JOU6ZD/tsn7HBkw8wtR94FlhqErliIFVIx1Yyrs4BB2eWkUKR+F9hIG8vu6e5sGBhZXOBtKvrA+xC0q8e5944aZXlq/gzV+P4Ma0oleh3e5+HPBGbcR70S1CazCx3vUxg8K04xiCAdm8AayHjOrjxxDiVDpkXxNEZuSRPxT6OVy19Sov9zPWuKV
X-MS-Exchange-AntiSpam-MessageData: fRoHPV4lVPMsC9FI4ifmGF/Gb6fl7uEQRN2tdHzGABkd0iJbx1dLC3LWS3QaXQEmimDGCL5ggIt2g5jy64Whnts7+E+yNCP55r8zu+4RsR1L9IxoXSIEW6/Fnef66K6EJNAE74tfDu4ES3JhrrcFhA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d77569-9e23-4683-748c-08d7daf2ccf0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2020 12:54:25.3284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jShof/komz1ue412mUEzW8Y84QIoxIcbyH0h0PDL8mBKvtHfqIxLczW41O1NMrq89JEzNpaYaa9Fj4wZ70LSUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4212
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 4/7/20 6:21 PM, YunQiang Su wrote:
> Xu, Yanfei <yanfei.xu@windriver.com> 于2020年4月7日周二 下午5:58写道：
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
>> 4.enable initramfs support and set the path about initramfs source file
>>
>> 5.make -j24
>>
>> [KEY] when your initramfs files is too large, and cause
>> usr/initramfs_data.cpio.gz
>>
>> compiled is larger than 225M, you will get the following error. BTW, x86
>> doesn't
> It is due to the JAL insn can only support <256MiB jump
>
>> have this issue that I have tested.
>>
>> ------------------------------error
>> messages-----------------------------------------
>>
>>     CHK     include/generated/compile.h
>>     LD      vmlinux.o
>>     MODPOST vmlinux.o
>>     MODINFO modules.builtin.modinfo
>>     GEN     modules.builtin
>>     LD      .tmp_vmlinux.kallsyms1
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
>> relocation truncated to fit: R_MIPS_26 against `unregister_pernet_subsys'
>> fs/ext4/super.o: In function `ext4_destroy_lazyinit_thread':
>> /home/wrsadmin/work/linux/kernel/linux-master/fs/ext4/super.c:3456:(.exit.text+0x24):
>> relocation truncated to fit: R_MIPS_26 against `kthread_stop'
>> fs/ext4/super.o: In function `unregister_as_ext2':
>> /home/wrsadmin/work/linux/kernel/linux-master/fs/ext4/super.c:6126:(.exit.text+0x30):
>> relocation truncated to fit: R_MIPS_26 against `unregister_filesystem'
>> fs/ext4/super.o: In function `unregister_as_ext3':
>> /home/wrsadmin/work/linux/kernel/linux-master/fs/ext4/super.c:6155:(.exit.text+0x3c):
>> relocation truncated to fit: R_MIPS_26 against `unregister_filesystem'
>> fs/ext4/super.o: In function `ext4_exit_fs':
>> /home/wrsadmin/work/linux/kernel/linux-master/fs/ext4/super.c:6261:(.exit.text+0x48):
>> relocation truncated to fit: R_MIPS_26 against `unregister_filesystem'
>> fs/ext4/super.o: In function `destroy_inodecache':
>> /home/wrsadmin/work/linux/kernel/linux-master/fs/ext4/super.c:1218:(.exit.text+0x50):
>> relocation truncated to fit: R_MIPS_26 against `rcu_barrier'
>> /home/wrsadmin/work/linux/kernel/linux-master/fs/ext4/super.c:1219:(.exit.text+0x5c):
>> additional relocation overflows omitted from the output
>> Makefile:1086: recipe for target 'vmlinux' failed
>> make[1]: *** [vmlinux] Error 1
>> Makefile:1058: recipe for target 'autoksyms_recursive' failed
>> make: *** [autoksyms_recursive] Error 2
>>
>>
>> Any comment will be appreciated.
> Maybe, you can have a try add  `-mlong-calls' to your CFLAGS.
> I am not sure that it can work.
>     https://gcc.gnu.org/onlinedocs/gcc/MIPS-Options.html

Ha, It does work. Many thanks!

Yanfei

>> Thanks,
>>
>> Yanfei
>>
>
