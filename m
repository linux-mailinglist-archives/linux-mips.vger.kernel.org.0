Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 999D8B1CC8
	for <lists+linux-mips@lfdr.de>; Fri, 13 Sep 2019 14:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729164AbfIMMCZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Sep 2019 08:02:25 -0400
Received: from mail4.protonmail.ch ([185.70.40.27]:23364 "EHLO
        mail4.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbfIMMCZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Sep 2019 08:02:25 -0400
Date:   Fri, 13 Sep 2019 12:02:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aurabindo.in;
        s=protonmail; t=1568376141;
        bh=W3A0sUxI2ZwZRVFK2SWzwum8eVXrjroeUR/zfFc53pk=;
        h=Date:To:From:Cc:Reply-To:Subject:Feedback-ID:From;
        b=jJ+eu/Afitsuhg4plFh48zDEIUX36zxds2JKta2gru2EIATY8hCyoj4gM4IEfWVvP
         /91bm2RKcpB037gZOfWD47tqmDzIkz0YaTKyxbptgfXeSLqIORwuwOXZV36JojnKcT
         GQYSBlhTpr9w7GGsiDQNssnmzlLEhNJtFLDlMJPM=
To:     ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org,
        alexios.zavras@intel.com, gregkh@linuxfoundation.org,
        armijn@tjaldur.nl, allison@lohutok.net, tglx@linutronix.de
From:   Aurabindo Jayamohanan <mail@aurabindo.in>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Reply-To: Aurabindo Jayamohanan <mail@aurabindo.in>
Subject: [PATCH] mips: check for dsp presence only once before save/restore
Message-ID: <20190913120206.9234-1-mail@aurabindo.in>
Feedback-ID: D1Wwva8zb0UdpJtanaReRLGO3iCsewpGmDn8ZDKmpao-Gnxd2qXPmwwrSQ99r5Q15lmK-D8x6vKzqhUKCgzweA==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF autolearn=ham
        autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

{save,restore}_dsp() internally checks if the cpu has dsp support.
Therefore, explicit check is not required before calling them in
{save,restore}_processor_state()

Signed-off-by: Aurabindo Jayamohanan <mail@aurabindo.in>
---
 arch/mips/power/cpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/power/cpu.c b/arch/mips/power/cpu.c
index 3340a5530de3..a15e29dfc7b3 100644
--- a/arch/mips/power/cpu.c
+++ b/arch/mips/power/cpu.c
@@ -19,8 +19,8 @@ void save_processor_state(void)
=20
 =09if (is_fpu_owner())
 =09=09save_fp(current);
-=09if (cpu_has_dsp)
-=09=09save_dsp(current);
+
+=09save_dsp(current);
 }
=20
 void restore_processor_state(void)
@@ -29,8 +29,8 @@ void restore_processor_state(void)
=20
 =09if (is_fpu_owner())
 =09=09restore_fp(current);
-=09if (cpu_has_dsp)
-=09=09restore_dsp(current);
+
+=09restore_dsp(current);
 }
=20
 int pfn_is_nosave(unsigned long pfn)
--=20
2.23.0


