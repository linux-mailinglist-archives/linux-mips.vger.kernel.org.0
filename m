Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A9521A08E4
	for <lists+linux-mips@lfdr.de>; Tue,  7 Apr 2020 10:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbgDGIHO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 Apr 2020 04:07:14 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17894 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726635AbgDGIHN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 Apr 2020 04:07:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1586246790;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=Qy5YaNnd6/cM8OXgjkd0XMTuk5DgHT3HQpv5IO5a37w=;
        b=YCkSRHAHqMkUUFftDERDmv4vI7EHg8/yzLmPN1DHa7HN+LVIWuVazA7x1C4gSP8x
        q391Xo+iV8OWzWRBGif14vG92yqdG7okaQZ5S5EG1woRPVXUJt4ucjivHWdoFfK34uI
        zEo0E7kkBKuS/CXdxfYCt3R1QIm6fjR6mY8n2iEI=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1586246787690535.912988010464; Tue, 7 Apr 2020 16:06:27 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        clang-built-linux@googlegroups.com,
        Fangrui Song <maskray@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org
Message-ID: <20200407080611.859256-1-jiaxun.yang@flygoat.com>
Subject: [PATCH v2] MIPS: Truncate load-y into 32bit for 32bit kernel
Date:   Tue,  7 Apr 2020 16:06:11 +0800
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200405082451.694910-1-jiaxun.yang@flygoat.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

LLD failed to link vmlinux with 64bit load address for 32bit ELF
while bfd will strip 64bit address into 32bit silently.
To fix LLD build, we should truncate load address provided by platform
into 32bit for 32bit kernel.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Fangrui Song <maskray@google.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>

--
V2: Take MaskRay's shell magic.
---
 arch/mips/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index e1c44aed8156..f8fd3c39fb55 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -286,6 +286,9 @@ ifdef CONFIG_64BIT
       $(error CONFIG_CPU_DADDI_WORKAROUNDS unsupported without -msym32)
     endif
   endif
+else
+=09# Truncate address into 32-bit
+=09load-y :=3D 0x$(shell echo "$(load-y)" | rev | head -c 8 | rev)
 endif
=20
 KBUILD_AFLAGS=09+=3D $(cflags-y)
--=20
2.26.0.rc2


