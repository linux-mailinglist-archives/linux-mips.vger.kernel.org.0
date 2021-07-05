Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 280EB3BB478
	for <lists+linux-mips@lfdr.de>; Mon,  5 Jul 2021 02:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbhGEANk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 4 Jul 2021 20:13:40 -0400
Received: from mxb.hotsplots.de ([185.46.137.13]:54616 "EHLO mxb.hotsplots.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229530AbhGEANk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 4 Jul 2021 20:13:40 -0400
X-Greylist: delayed 489 seconds by postgrey-1.27 at vger.kernel.org; Sun, 04 Jul 2021 20:13:39 EDT
From:   =?UTF-8?Q?Martin_F=c3=a4cknitz?= <faecknitz@hotsplots.de>
Subject: [PATCH] invalid GIC access through VDSO
To:     linux-mips@vger.kernel.org
Message-ID: <48756553-5aa2-f07f-ca69-0e4d6bda8f24@hotsplots.de>
Date:   Mon, 5 Jul 2021 02:03:54 +0200
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------21EAFA0509A76C9450879057"
Content-Language: de-DE
X-Spamd-Result: default: False [0.28 / 500.00];
         MIME_TRACE(0.00)[0:+,1:+,2:+];
         R_MIXED_CHARSET(0.38)[subject];
         MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
         FROM_HAS_DN(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         HAS_ATTACHMENT(0.00)[];
         FROM_EQ_ENVFROM(0.00)[];
         TO_DN_NONE(0.00)[];
         RCVD_COUNT_ZERO(0.00)[0];
         ASN(0.00)[asn:3320, ipnet:84.128.0.0/10, country:DE];
         RCPT_COUNT_ONE(0.00)[1];
         MID_RHS_MATCH_FROM(0.00)[]
X-Spamd-Bar: /
X-Rspamd-Server: mxb
Authentication-Results: ORIGINATING;
        auth=pass smtp.auth=faecknitz@hotsplots.de smtp.mailfrom=faecknitz@hotsplots.de
X-Rspamd-Queue-Id: 7A84F8C03E2
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This is a multi-part message in MIME format.
--------------21EAFA0509A76C9450879057
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Accessing raw timers (currently only CLOCK_MONOTONIC_RAW) through VDSO doesn't
return the correct time when using the GIC as clock source. The address of the
GIC mapped page is in this case not calculated correctly. The GIC mapped page
is calculated from the VDSO data by subtracting PAGE_SIZE:

  void *get_gic(const struct vdso_data *data) {
    return (void __iomem *)data - PAGE_SIZE;
  }

However, the data pointer is not page aligned for raw clock sources. This is
because the VDSO data for raw clock sources (CS_RAW = 1) is stored after the
VDSO data for coarse clock sources (CS_HRES_COARSE = 0). Therefore, only the
VDSO data for CS_HRES_COARSE is page aligned:

  +--------------------+
  |                    |
  | vd[CS_RAW]         | ---+
  | vd[CS_HRES_COARSE] |    |
  +--------------------+    | -PAGE_SIZE
  |                    |    |
  |  GIC mapped page   | <--+
  |                    |
  +--------------------+

When __arch_get_hw_counter() is called with &vd[CS_RAW], get_gic returns the
wrong address (somewhere inside the GIC mapped page). The GIC counter values
are not returned which results in an invalid time.

Signed-off-by: Martin Fäcknitz <faecknitz@hotsplots.de>


--------------21EAFA0509A76C9450879057
Content-Type: text/x-patch;
 name="gic-vdso.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="gic-vdso.patch"

--- a/arch/mips/include/asm/vdso/vdso.h
+++ b/arch/mips/include/asm/vdso/vdso.h
@@ -67,7 +67,7 @@ static inline const struct vdso_data *get_vdso_data(voi=
d)
=20
 static inline void __iomem *get_gic(const struct vdso_data *data)
 {
-	return (void __iomem *)data - PAGE_SIZE;
+	return (void __iomem *)((unsigned long)data & PAGE_MASK) - PAGE_SIZE;
 }
=20
 #endif /* CONFIG_CLKSRC_MIPS_GIC */

--------------21EAFA0509A76C9450879057--
