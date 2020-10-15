Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80CCD28F9EE
	for <lists+linux-mips@lfdr.de>; Thu, 15 Oct 2020 22:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392128AbgJOULW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 15 Oct 2020 16:11:22 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:36067 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2392062AbgJOULV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 15 Oct 2020 16:11:21 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 6429A29E;
        Thu, 15 Oct 2020 16:11:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 15 Oct 2020 16:11:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com.au;
         h=from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=p3zu/cefH86xg/aUzHvcWl81VJ
        wMhU22jPj9AsFjrpQ=; b=BYkc1zAepPy9nxTUnqjK+XkKbBqtx5+c2NWbD1WemR
        oGhSYqRoOD7KX7l64lnNlzwv1HT2SWC7UpeddEjRVdcJl+Dl94VuqXcSNf55KTxM
        ndPC1qeu1bvzhu6/AR9XpZtuZpPadpYWC8J1kitHCRhu15xaoKOgJcqZ0ZSN/iq+
        6e44Rku7Cz4Pr3czzgrjV0MPsEcw/z0WFVtoEFVA34ZbKozMyic1oPBNqABYLtPK
        NpZKR+tucS+cvNWNsQ0+kYmjXlaItjwQSIU3Lk5BJKKmKJ6DYxQ3fDGmA4qFr4Dd
        EJGZCiVL2U6jyMOq3MvQsIXX35nsP8fevFs0ATy1n8pw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=p3zu/cefH86xg/aUz
        HvcWl81VJwMhU22jPj9AsFjrpQ=; b=XjEw5+e96GYsX1+lfNwgTHOmayLpY2XAZ
        Az6lOrw1qm2ONDOZTEuiaX95uyjDYKr2H99Zmv4HiiEBzti96Tj5wIczASCgPXxZ
        Ef52xhn0eMu+aDRhYpW7aEXst7AErM/4KYdSx4Z5LNgVmK+yNXGgABOcPF5dm+YC
        U96PbSIZOTzpXScpwedx4E66TsaEmHs3agVDhNTV1oy6yi91MLhjSkAc+YkTHp9S
        Liquly+lAoNiel8R9cp23DHYZFa1cUwO8dJ4ZyjsDYYoUyILKbgIp/tiPwlyFTeF
        Gzk5nvr6GZuAYitRhlO79fEf4UzKVV2zxMrS5x52C6E/fdFBNTQ1w==
X-ME-Sender: <xms:56yIX8o3sqe5oBrgNU2n6TPK_dSVXnG98_dJ0d2ccB5NIY1MesIulA>
    <xme:56yIXypZL2diovQR8xc2zsMHyD6EDnx_52PbQ4T_G3F_h8x_-BIewHeM3x7OhqVdK
    iVUQHcisCYpsNi4sQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrieefgddugeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeflohhhnhcuvfhh
    ohhmshhonhcuoehgihhtsehjohhhnhhthhhomhhsohhnrdhfrghsthhmrghilhdrtghomh
    drrghuqeenucggtffrrghtthgvrhhnpeeiheejgeeigfethfeiffekfeegkeefjeeifeeu
    tefgveejgedtheeuvefgfeefueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukf
    hppeehkedrudeihedrudeluddrieejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepghhithesjhhohhhnthhhohhmshhonhdrfhgrshhtmhgrih
    hlrdgtohhmrdgruh
X-ME-Proxy: <xmx:56yIXxMLXQ_ylcFcAdRGXDPE7oVmGD5qNEszuNFXyvbgSdSjP568pw>
    <xmx:56yIXz41-Ba-hZkTriZ2aumpODWNd0gUBoN4Or6SlwXI7i5MBsJ4gw>
    <xmx:56yIX74j8NzByD1rwRD6Ujv7SEidclios1Uxyk3ajttDgwHdKsuAJg>
    <xmx:6KyIX1RqXW5RZRD-oWibg7f_Sfx0fUARESskkMfv3_Pp07UaHt26iA>
Received: from john.thome.spur.red (unknown [58.165.191.67])
        by mail.messagingengine.com (Postfix) with ESMTPA id ACAE03280066;
        Thu, 15 Oct 2020 16:11:17 -0400 (EDT)
From:   John Thomson <git@johnthomson.fastmail.com.au>
To:     linux-mips@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org,
        John Thomson <git@johnthomson.fastmail.com.au>
Subject: [PATCH 1/2] mips: boot compressed: preprocess linker script
Date:   Fri, 16 Oct 2020 06:10:59 +1000
Message-Id: <20201015201100.4130-1-git@johnthomson.fastmail.com.au>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Preprocess vmlinuz (self-decompressing kernel ELF) linker script
to avoid using ld -Ttext $(address)
https://lkml.kernel.org/lkml/20200413153453.zi4jvu3c4ul23e23@google.com/

Signed-off-by: John Thomson <git@johnthomson.fastmail.com.au>
---
 arch/mips/boot/compressed/.gitignore                   | 1 +
 arch/mips/boot/compressed/Makefile                     | 8 ++++++--
 arch/mips/boot/compressed/{ld.script => vmlinuz.lds.S} | 2 +-
 3 files changed, 8 insertions(+), 3 deletions(-)
 rename arch/mips/boot/compressed/{ld.script => vmlinuz.lds.S} (96%)

diff --git a/arch/mips/boot/compressed/.gitignore b/arch/mips/boot/compressed/.gitignore
index d358395614c..1c367a2efb9 100644
--- a/arch/mips/boot/compressed/.gitignore
+++ b/arch/mips/boot/compressed/.gitignore
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 ashldi3.c
 bswapsi.c
+vmlinuz.lds
diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
index 6e56caef69f..49d1adceade 100644
--- a/arch/mips/boot/compressed/Makefile
+++ b/arch/mips/boot/compressed/Makefile
@@ -96,11 +96,15 @@ UIMAGE_LOADADDR = $(VMLINUZ_LOAD_ADDRESS)
 
 vmlinuzobjs-y += $(obj)/piggy.o
 
+targets += vmlinuz.lds
+$(obj)/vmlinuz.lds: $(obj)/calc_vmlinuz_load_addr $(obj)/vmlinux.bin
+CPPFLAGS_vmlinuz.lds = -DVMLINUZ_LOAD_ADDRESS="$(VMLINUZ_LOAD_ADDRESS)"
+
 quiet_cmd_zld = LD      $@
-      cmd_zld = $(LD) $(KBUILD_LDFLAGS) -Ttext $(VMLINUZ_LOAD_ADDRESS) -T $< $(vmlinuzobjs-y) -o $@
+      cmd_zld = $(LD) $(KBUILD_LDFLAGS) -T $< $(vmlinuzobjs-y) -o $@
 quiet_cmd_strip = STRIP	  $@
       cmd_strip = $(STRIP) -s $@
-vmlinuz: $(src)/ld.script $(vmlinuzobjs-y) $(obj)/calc_vmlinuz_load_addr
+vmlinuz: $(obj)/vmlinuz.lds $(vmlinuzobjs-y) $(obj)/calc_vmlinuz_load_addr
 	$(call cmd,zld)
 	$(call cmd,strip)
 
diff --git a/arch/mips/boot/compressed/ld.script b/arch/mips/boot/compressed/vmlinuz.lds.S
similarity index 96%
rename from arch/mips/boot/compressed/ld.script
rename to arch/mips/boot/compressed/vmlinuz.lds.S
index 2ed08fbef8e..890c31c55c1 100644
--- a/arch/mips/boot/compressed/ld.script
+++ b/arch/mips/boot/compressed/vmlinuz.lds.S
@@ -14,7 +14,7 @@ PHDRS {
 SECTIONS
 {
 	/* Text and read-only data */
-	/* . = VMLINUZ_LOAD_ADDRESS; */
+	. = VMLINUZ_LOAD_ADDRESS;
 	.text : {
 		*(.text)
 		*(.rodata)
-- 
2.28.0

