Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C221A1D2521
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 04:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725895AbgENC2T (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 22:28:19 -0400
Received: from mail.loongson.cn ([114.242.206.163]:47482 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725874AbgENC2T (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 13 May 2020 22:28:19 -0400
Received: from [10.20.42.25] (unknown [10.20.42.25])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx793ArLxeIHc0AA--.12S3;
        Thu, 14 May 2020 10:28:16 +0800 (CST)
To:     linux-mips <linux-mips@vger.kernel.org>
From:   maobibo <maobibo@loongson.cn>
Subject: rtc is missing with mips-next tree
Message-ID: <14cd0164-bc85-4ca2-65b0-b41688e034dc@loongson.cn>
Date:   Thu, 14 May 2020 10:28:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dx793ArLxeIHc0AA--.12S3
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
        VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYs7k0a2IF6FyUM7kC6x804xWl14x267AK
        xVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
        A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j
        6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr
        1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY
        62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7V
        C2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0
        c2IEe2xFo4CEbIxvr21lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
        AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
        17CEb7AF67AKxVWUJVWUXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
        IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3
        Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
        sGvfC2KfnxnUUI43ZEXa7IU8pnQUUUUUU==
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


Hi,

On my rs780 machine with latest mips-next tree, rtc is missing with loongson3_defconfig

Here is message:

[root@mips-mainline test]# hwclock --debug
hwclock from util-linux 2.23.2
hwclock: cannot open /dev/rtc: No such file or directory
No usable clock interface found.
hwclock: Cannot access the Hardware Clock via any known method.

[root@mips-mainline test]# date
Thu Jan  1 08:16:56 CST 1970


regards
bibo,mao

