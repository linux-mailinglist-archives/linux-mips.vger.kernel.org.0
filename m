Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 730241A0A9C
	for <lists+linux-mips@lfdr.de>; Tue,  7 Apr 2020 11:58:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728091AbgDGJ6f (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 Apr 2020 05:58:35 -0400
Received: from mail-bn7nam10on2059.outbound.protection.outlook.com ([40.107.92.59]:6144
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728191AbgDGJ6f (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 7 Apr 2020 05:58:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C8SHLIDWu1INnSgs5kK/q1HtRgFENsCftvCLUjGq0OvmpE1BkiJ+EWTKn+6y5Oc9OBmb9BgEJNCEnw9bBTpUyPAPF7WWFOdyc4GTcZU0gnvCZbr7x6T7B44PKqzFliQOFIlOldc0Uc8k7Z60Ua0bWvpw+q0Ggo1Z66z8l1InKzMxEvUPq31nsbFMcZ2F0izAP4UnvndxYJgR5P2DpbIKhA9lfvCrFAziJpX+5+b3QxUE3B3IULKDhHgt3DttkZPfC9LXVYJPyTBfAuv2i5kapSkXbUO+393O3o3dPsc+a1qZalCgM7zuVZWblJ2wZI/av7HBXpGw/C2sBzWW3OszrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81d07uDWZ2M0pl3GJghVSB14yRRhnsKkyLhQ5jIqm8s=;
 b=XT0d6T5DMOUS3leVM2GpmSlPpMvI/JPuEDXStDth9a9H/4kNhTpW5O2r4voqGX61Ea9u5IDngsvqop4Ah87sy+bxhdpYepq7dAmQ3GSXgxs6PPBztWMUuHn2cLOx2btiA4zFZW97QAEul/M7QNQ0RrYhLovq5Pv99iAziPhyVX6UP2FEU18xLTvdpr3MsMcgy+UZtNtXlPgBV+a+rfnCDGn0Aude+wa1D1DgyJaCgTtAL5eyjOd2Vx6Q0dokM50+DECn1fzQfy0PaR5za/Ueoxr9Q65qaj4tycUQ7IQXQruwl4mRHHmVIoxyH8l43ZhAqeu/IBZyj9l8sQG3c50VOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81d07uDWZ2M0pl3GJghVSB14yRRhnsKkyLhQ5jIqm8s=;
 b=gG/xzRTZUECouw3TxpvZqDSECi9v+nrsaPX1rxtzqlIHxop1NAI49aCbwtwH1G6KlC00Tw6oMU8jcOtQsz3DOYCbgNsRHtrbIafhct+pXpgVe/7gvW9qluEpjj+Y8lkOheWrbWaXeR8qQcnrUMG+YZbiZH969ci2rYkQVFNcLLE=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yanfei.Xu@windriver.com; 
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by BY5PR11MB4151.namprd11.prod.outlook.com (2603:10b6:a03:18f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.20; Tue, 7 Apr
 2020 09:58:31 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::80a8:667c:426b:6917]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::80a8:667c:426b:6917%7]) with mapi id 15.20.2878.018; Tue, 7 Apr 2020
 09:58:30 +0000
From:   "Xu, Yanfei" <yanfei.xu@windriver.com>
Subject: BUG: mips: errors when compiling kernel with a large initramfs
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <0c1e4eda-53c6-ea8b-c27b-eabc8569cc74@windriver.com>
Date:   Tue, 7 Apr 2020 17:58:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: HK2PR02CA0203.apcprd02.prod.outlook.com
 (2603:1096:201:20::15) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.160] (60.247.85.82) by HK2PR02CA0203.apcprd02.prod.outlook.com (2603:1096:201:20::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15 via Frontend Transport; Tue, 7 Apr 2020 09:58:29 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e7b969e-bd51-468e-e468-08d7dada39d0
X-MS-TrafficTypeDiagnostic: BY5PR11MB4151:
X-Microsoft-Antispam-PRVS: <BY5PR11MB415180C650EADECB837FB822E4C30@BY5PR11MB4151.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 036614DD9C
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(346002)(376002)(136003)(366004)(39850400004)(396003)(6916009)(5660300002)(8676002)(81166006)(66476007)(8936002)(66556008)(36756003)(6666004)(86362001)(6486002)(31696002)(66946007)(478600001)(16526019)(26005)(316002)(4326008)(956004)(81156014)(2906002)(186003)(16576012)(31686004)(52116002)(6706004)(2616005)(78286006);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: windriver.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: exJpxNwaB/L9U9BBCinQ6OTs5pnL5H7og5YvfwCqorp+VnsUDb4lijWEz6GUkRBCbber+kioPmKpzuEhvEDnNjzh9SVmRL9Q5Mll7ocY3YyOOoVg2bZfMqZXPFkeST2a/apFr0mUfHcgG8IaNxH4/BGpME1ZEv3Deyt4TSRPjHzGxb9ZGdQjELdmSYkI9VUzodM8qVBG3MZLA//T3q2fQysBD6YaIn4oa0AFkOTlk/wsqqbj+H9QwhNpft3pbuc9JIVTagn6wDrTYhc/dtFWRaJNDkuw30cB8csWyaA3uRCm8MSrNzjJ3d+pdDNZrVzwqAZWvB3kX67kmh3BkSUqXLktsvF1GZXm69muAxvxS9S6f8clWmfwcIZjAYqFSRe6MA+eoLV6Mhd/Jr9SHFK2u0LT4Ex+o5XCnlId36EN40V83qIFMaRAc2SkpMw2wreHzKvhaH37bn/mlnSX6V5+gzgF4sJfvHOOh7He735xLnULh2E5CA7/37mugNF6rjc/jBDJKjDtUauuJxNJ64WDWL0efgniUM2Q7tEE980RnuI=
X-MS-Exchange-AntiSpam-MessageData: 37vA5ackbd3Lw+m4JtjKUyq0HOx3KQysZRgfwPQDKsS5I1/emLRgfZPhlpYlyw5m6fYeerSJB3424cGn9Xxi4tCFscUFmJ078w7CYakfTKlcFk6aFCW7UsAHLbCN1BcRvzX7GPkDz4IW/OZFUebszg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e7b969e-bd51-468e-e468-08d7dada39d0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2020 09:58:30.7959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7OK2Qdy3xAnpUeY0RaeWElFAT5BAL7reF7dzDPRUcLkxcNGdzAsyjsSykfBjCmqWJm4RHyQ5PSwG+3B6gd3Rsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4151
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,


It fails to compile mips kernel with large initramfs (at link time).

kernel version: 5.6.0


Steps to reproduce:

1. git clone mainline kernel

2. set ARCH=mips and CROSS_COMPILE=mips-linux-gnu-

3. make defconfig

4.enable initramfs support and set the path about initramfs source file

5.make -j24

[KEY] when your initramfs files is too large, and cause 
usr/initramfs_data.cpio.gz

compiled is larger than 225M, you will get the following error. BTW, x86 
doesn't

have this issue that I have tested.

------------------------------error 
messages-----------------------------------------

   CHK     include/generated/compile.h
   LD      vmlinux.o
   MODPOST vmlinux.o
   MODINFO modules.builtin.modinfo
   GEN     modules.builtin
   LD      .tmp_vmlinux.kallsyms1
kernel/configs.o: In function `ikconfig_cleanup':
/home/wrsadmin/work/linux/kernel/linux-master/kernel/configs.c:72:(.exit.text+0x8): 
relocation truncated to fit: R_MIPS_26 against `remove_proc_entry'
fs/binfmt_script.o: In function `exit_script_binfmt':
/home/wrsadmin/work/linux/kernel/linux-master/fs/binfmt_script.c:165:(.exit.text+0x4): 
relocation truncated to fit: R_MIPS_26 against `unregister_binfmt'
fs/binfmt_elf.o: In function `exit_elf_binfmt':
/home/wrsadmin/work/linux/kernel/linux-master/fs/binfmt_elf.c:2393:(.exit.text+0x4): 
relocation truncated to fit: R_MIPS_26 against `unregister_binfmt'
fs/mbcache.o: In function `mbcache_exit':
/home/wrsadmin/work/linux/kernel/linux-master/fs/mbcache.c:429:(.exit.text+0x4): 
relocation truncated to fit: R_MIPS_26 against `kmem_cache_destroy'
fs/nfs_common/grace.o: In function `exit_grace':
/home/wrsadmin/work/linux/kernel/linux-master/fs/nfs_common/grace.c:133:(.exit.text+0x4): 
relocation truncated to fit: R_MIPS_26 against `unregister_pernet_subsys'
fs/ext4/super.o: In function `ext4_destroy_lazyinit_thread':
/home/wrsadmin/work/linux/kernel/linux-master/fs/ext4/super.c:3456:(.exit.text+0x24): 
relocation truncated to fit: R_MIPS_26 against `kthread_stop'
fs/ext4/super.o: In function `unregister_as_ext2':
/home/wrsadmin/work/linux/kernel/linux-master/fs/ext4/super.c:6126:(.exit.text+0x30): 
relocation truncated to fit: R_MIPS_26 against `unregister_filesystem'
fs/ext4/super.o: In function `unregister_as_ext3':
/home/wrsadmin/work/linux/kernel/linux-master/fs/ext4/super.c:6155:(.exit.text+0x3c): 
relocation truncated to fit: R_MIPS_26 against `unregister_filesystem'
fs/ext4/super.o: In function `ext4_exit_fs':
/home/wrsadmin/work/linux/kernel/linux-master/fs/ext4/super.c:6261:(.exit.text+0x48): 
relocation truncated to fit: R_MIPS_26 against `unregister_filesystem'
fs/ext4/super.o: In function `destroy_inodecache':
/home/wrsadmin/work/linux/kernel/linux-master/fs/ext4/super.c:1218:(.exit.text+0x50): 
relocation truncated to fit: R_MIPS_26 against `rcu_barrier'
/home/wrsadmin/work/linux/kernel/linux-master/fs/ext4/super.c:1219:(.exit.text+0x5c): 
additional relocation overflows omitted from the output
Makefile:1086: recipe for target 'vmlinux' failed
make[1]: *** [vmlinux] Error 1
Makefile:1058: recipe for target 'autoksyms_recursive' failed
make: *** [autoksyms_recursive] Error 2


Any comment will be appreciated.

Thanks,

Yanfei

