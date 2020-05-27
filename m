Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A2FF1E395C
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2020 08:36:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726924AbgE0Gfj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 May 2020 02:35:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725613AbgE0Gfi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 May 2020 02:35:38 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F969C061A0F;
        Tue, 26 May 2020 23:35:38 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id BB7FF20D15;
        Wed, 27 May 2020 06:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1590561337; bh=cmb5jHjkTE4gJHfh5y1hfV9HBrp0VEazo8pT0pJRWDE=;
        h=From:To:Cc:Subject:Date:From;
        b=Ad/I7leLweQ3vNr814XqoE+0VxjVzdAcj5ldidGxmOo4KTBHJKaO2wqyKKqdxG2zE
         tj0KliUcOCJpiPTBM+TKFlbw0ECEx5DW57+CMYLRBeBEbfHbYhWjjQqjY+9Jwzq2Zl
         w4p0FGzcuJOmxAbz0pUVFoyRo1DH1I9i35rckdp2ly9kwfG7WVbj2WPnriNTMu5dwv
         YKJzUjXLSIRu5JZKLBtYu4I4zZaS6yRva/Jjemc7oIIy/srnE8vVhnXSofBqLjPNDG
         3KOXn3+32QkL0q4wXW9H4ZhNG+NS/uXi4phO2F73tvqsyrBTrD6y4sW3Tfnxl3qoZo
         cZNdu344RK7xQ==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Kees Cook <keescook@chromium.org>,
        Borislav Petkov <bp@suse.de>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Buggy bootloader workaround v2
Date:   Wed, 27 May 2020 14:34:31 +0800
Message-Id: <20200527063438.391949-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.27.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v2: Fixed typo due to keyboard failure.

Jiaxun Yang (3):
  MIPS: head.S: Always jump to kernel_entry at head of text
  MIPS: Move kernel head into a standalone section
  MIPS: Loongson64: select NO_EXCEPT_FILL

 arch/mips/Kconfig              | 1 +
 arch/mips/kernel/head.S        | 6 ++----
 arch/mips/kernel/vmlinux.lds.S | 8 ++++++--
 3 files changed, 9 insertions(+), 6 deletions(-)

-- 
2.27.0.rc0

