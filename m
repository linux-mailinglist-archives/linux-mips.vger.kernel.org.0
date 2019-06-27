Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2221A58BEA
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2019 22:43:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbfF0UnU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 Jun 2019 16:43:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:57582 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726426AbfF0UnU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 27 Jun 2019 16:43:20 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 828302075E;
        Thu, 27 Jun 2019 20:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561668198;
        bh=Xd6rIJtf3H8X+yslIzEPNG9SJGOP8h1KGRQYdi+Nh74=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=VPoIQktnV79R1ByGMdQqofepgjBWQBTXBQYDHXfjll3u6vNPWMS7IkorEvqw6CVcG
         64tzppQNstnhRP4JyA0oWDWXNiUUVhFymsaCDFaVEu87/aUfdkB+WbpH2FCuvQCXhD
         6uy9BzIfMNKT9NLrociDwbC5ygMesCVCcn+zG9Wc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190502122657.15577-3-jonas.gorski@gmail.com>
References: <20190502122657.15577-1-jonas.gorski@gmail.com> <20190502122657.15577-3-jonas.gorski@gmail.com>
To:     Jonas Gorski <jonas.gorski@gmail.com>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-mips@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/3] clk: add BCM63XX gated clock controller driver
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Kevin Cernekee <cernekee@gmail.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>
User-Agent: alot/0.8.1
Date:   Thu, 27 Jun 2019 13:43:17 -0700
Message-Id: <20190627204318.828302075E@mail.kernel.org>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Jonas Gorski (2019-05-02 05:26:56)
> Add a driver for the gated clock controller found on MIPS based BCM63XX
> SoCs.
>=20
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> ---

Applied to clk-next with some extra fixes

diff --git a/drivers/clk/bcm/clk-bcm63xx-gate.c b/drivers/clk/bcm/clk-bcm63=
xx-gate.c
index 4fd10645a192..9e1dcd43258c 100644
--- a/drivers/clk/bcm/clk-bcm63xx-gate.c
+++ b/drivers/clk/bcm/clk-bcm63xx-gate.c
@@ -1,8 +1,7 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+// SPDX-License-Identifier: GPL-2.0
=20
 #include <linux/clk-provider.h>
 #include <linux/init.h>
-#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
@@ -20,7 +19,7 @@ struct clk_bcm63xx_hw {
 	struct clk_hw_onecell_data data;
 };
=20
-const struct clk_bcm63xx_table_entry bcm3368_clocks[] =3D {
+static const struct clk_bcm63xx_table_entry bcm3368_clocks[] =3D {
 	{ .name =3D "mac", .bit =3D 3, },
 	{ .name =3D "tc", .bit =3D 5, },
 	{ .name =3D "us_top", .bit =3D 6, },
@@ -41,7 +40,7 @@ const struct clk_bcm63xx_table_entry bcm3368_clocks[] =3D=
 {
 	{ },
 };
=20
-const struct clk_bcm63xx_table_entry bcm6328_clocks[] =3D {
+static const struct clk_bcm63xx_table_entry bcm6328_clocks[] =3D {
 	{ .name =3D "phy_mips", .bit =3D 0, },
 	{ .name =3D "adsl_qproc", .bit =3D 1, },
 	{ .name =3D "adsl_afe", .bit =3D 2, },
@@ -57,7 +56,7 @@ const struct clk_bcm63xx_table_entry bcm6328_clocks[] =3D=
 {
 	{ },
 };
=20
-const struct clk_bcm63xx_table_entry bcm6358_clocks[] =3D {
+static const struct clk_bcm63xx_table_entry bcm6358_clocks[] =3D {
 	{ .name =3D "enet", .bit =3D 4, },
 	{ .name =3D "adslphy", .bit =3D 5, },
 	{ .name =3D "pcm", .bit =3D 8, },
@@ -72,7 +71,7 @@ const struct clk_bcm63xx_table_entry bcm6358_clocks[] =3D=
 {
 	{ },
 };
=20
-const struct clk_bcm63xx_table_entry bcm6362_clocks[] =3D {
+static const struct clk_bcm63xx_table_entry bcm6362_clocks[] =3D {
 	{ .name =3D "adsl_qproc", .bit =3D 1, },
 	{ .name =3D "adsl_afe", .bit =3D 2, },
 	{ .name =3D "adsl", .bit =3D 3, },
@@ -95,7 +94,7 @@ const struct clk_bcm63xx_table_entry bcm6362_clocks[] =3D=
 {
 	{ },
 };
=20
-const struct clk_bcm63xx_table_entry bcm6368_clocks[] =3D {
+static const struct clk_bcm63xx_table_entry bcm6368_clocks[] =3D {
 	{ .name =3D "vdsl_qproc", .bit =3D 2, },
 	{ .name =3D "vdsl_afe", .bit =3D 3, },
 	{ .name =3D "vdsl_bonding", .bit =3D 4, },
@@ -116,7 +115,7 @@ const struct clk_bcm63xx_table_entry bcm6368_clocks[] =
=3D {
 	{ },
 };
=20
-const struct clk_bcm63xx_table_entry bcm63268_clocks[] =3D {
+static const struct clk_bcm63xx_table_entry bcm63268_clocks[] =3D {
 	{ .name =3D "disable_gless", .bit =3D 0, },
 	{ .name =3D "vdsl_qproc", .bit =3D 1, },
 	{ .name =3D "vdsl_afe", .bit =3D 2, },
@@ -225,22 +224,15 @@ static const struct of_device_id clk_bcm63xx_dt_ids[]=
 =3D {
 	{ .compatible =3D "brcm,bcm6362-clocks", .data =3D &bcm6362_clocks, },
 	{ .compatible =3D "brcm,bcm6368-clocks", .data =3D &bcm6368_clocks, },
 	{ .compatible =3D "brcm,bcm63268-clocks", .data =3D &bcm63268_clocks, },
-	{ },
+	{ }
 };
=20
-MODULE_DEVICE_TABLE(of, clk_bcm63xx_dt_ids);
-
 static struct platform_driver clk_bcm63xx =3D {
 	.probe =3D clk_bcm63xx_probe,
 	.remove =3D clk_bcm63xx_remove,
 	.driver =3D {
 		.name =3D "bcm63xx-clock",
-		.of_match_table =3D of_match_ptr(clk_bcm63xx_dt_ids),
+		.of_match_table =3D clk_bcm63xx_dt_ids,
 	},
 };
-
 builtin_platform_driver(clk_bcm63xx);
-
-MODULE_AUTHOR("Jonas Gorski <jonas.gorski@gmail.com>");
-MODULE_DESCRIPTION("BCM63XX (MIPS) gated clock controller driver");
-MODULE_LICENSE("GPL");

