Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE1E32FE1F1
	for <lists+linux-mips@lfdr.de>; Thu, 21 Jan 2021 06:44:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbhAUFng (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 Jan 2021 00:43:36 -0500
Received: from mail.loongson.cn ([114.242.206.163]:47434 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726765AbhAUFcn (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 21 Jan 2021 00:32:43 -0500
Received: from loongson.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxeL7GEQlgHXEIAA--.13206S2;
        Thu, 21 Jan 2021 13:31:51 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Burton <paulburton@kernel.org>,
        Jun-Ru Chang <jrjang@realtek.com>
Subject: [PATCH v2 0/4] MIPS: process: Some fixes and improvements about get_frame_info()
Date:   Thu, 21 Jan 2021 13:31:34 +0800
Message-Id: <1611207098-11381-1-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9DxeL7GEQlgHXEIAA--.13206S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZw18Cw4kWr1DGr45ury7Awb_yoW3Jrc_JF
        97tF93Gw48XF48JFyjkFsYqrWDGr4jkry5ZFsFgrsrC34xAF1fZFWDC3yIqrn3Zay2yF43
        Xwn8Ar97AwnxujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb2kYjsxI4VWkKwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6r4rMxAIw28I
        cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
        IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI
        42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42
        IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
        z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5LZ2DUUUUU==
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Not familiar with microMIPS. Not test on microMIPS.

Changelog v2:
- Thanks to Thomas for suggesting that remove and sort header includes.
  [PATCH 1/4] for details.
- Thanks to Jiaxun for test v1 and told me it stuck at loading init.
  I mistakenly thought that r_format.rs and pool32a_format.rs are the same.
  See [PATCH 4/4] for details.

Jinyang He (4):
  MIPS: process: Remove unnecessary headers inclusion
  MIPS: microMIPS: Fix the judgment of mm_jr16_op and mm_jalr_op
  MIPS: Fix get_frame_info() handing of function size
  MIPS: Add is_jr_ra_ins() to end the loop early

 arch/mips/kernel/process.c | 87 ++++++++++++++++++++++++++--------------------
 1 file changed, 50 insertions(+), 37 deletions(-)

-- 
2.1.0

