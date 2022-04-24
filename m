Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B4A050CE7C
	for <lists+linux-mips@lfdr.de>; Sun, 24 Apr 2022 04:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237718AbiDXCih (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 23 Apr 2022 22:38:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237712AbiDXCid (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 23 Apr 2022 22:38:33 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 04488193D4
        for <linux-mips@vger.kernel.org>; Sat, 23 Apr 2022 19:35:26 -0700 (PDT)
Received: from localhost.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxjxBrt2RidRIvAA--.30985S2;
        Sun, 24 Apr 2022 10:35:23 +0800 (CST)
From:   Hui Li <lihui@loongson.cn>
To:     Simon Horman <horms@verge.net.au>
Cc:     Eric Biederman <ebiederm@xmission.com>, kexec@lists.infradead.org,
        linux-mips@vger.kernel.org
Subject: [PATCH v2 0/2] kexec-tools:mips: Fix Kernel panic problem
Date:   Sun, 24 Apr 2022 10:35:21 +0800
Message-Id: <20220424023523.16869-1-lihui@loongson.cn>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxjxBrt2RidRIvAA--.30985S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJr1xGF4UAF15JrW8JF4fKrg_yoW8Gw13pr
        42kFW5Jrs5Cw12vw1fAF4jq3yrAws3t3W0qFWSga9xZasYgr1qq3yavr15Jrnrtw1xK3W0
        vr4FgF1YkFsxZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkSb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjc
        xK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
        Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJV
        W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6r4UMxAI
        w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
        4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxG
        rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
        CI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
        cVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU2a9aDUUUU
X-CM-SenderInfo: 5olk3xo6or00hjvr0hdfq/
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Under loongson platform,use command:
kexec -l vmlinux... --append="root=UUID=28e1..." --initrd=...
kexec -e
quick restart failed like this:

[    3.420791] VFS: Cannot open root device "UUID=6462a8a4-02fb-49ff-bcb6-54fe53813c2a" or unknown-block(0,0): error -6
[    3.431262] Please append a correct "root=" boot option; here are the available partitions:
...
...
...
[    3.543175]   0801         4194304 sda1 554e69cc-01
[    3.543175] 
[    3.549494]   0802        62914560 sda2 554e69cc-02
[    3.549495] 
[    3.555818]   0803         8388608 sda3 554e69cc-03
[    3.555819] 
[    3.562139]   0804       174553229 sda4 554e69cc-04
[    3.562139] 
[    3.568463] 0b00         1048575 sr0 
[    3.568464]  driver: sr
[    3.574524] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
[    3.582750] ---[ end Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0) ]---


The reason of this problem:
The kernel cannot parse the UUID,UUID is parsed in the initrd.
Loongson platform obtain the initrd through cmdline in kernel.
In kexec-tools, initrd is not added to cmdline.

The following two steps to solve this problem.

Hui Li (2):
  kexec-tools: mips: Add CONFIG_LOONGSON option.
  kexec-tools: mips: Add initrd parameter to cmdline

 configure.ac                     |  5 ++++
 kexec/arch/mips/crashdump-mips.h |  6 ++++-
 kexec/arch/mips/kexec-elf-mips.c | 43 ++++++++++++++++++++++++++++++++
 3 files changed, 53 insertions(+), 1 deletion(-)

-- 
2.20.1

