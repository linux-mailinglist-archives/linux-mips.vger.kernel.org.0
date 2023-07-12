Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26D1B7505B4
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jul 2023 13:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232594AbjGLLOb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Jul 2023 07:14:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232306AbjGLLOb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Jul 2023 07:14:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D211173A
        for <linux-mips@vger.kernel.org>; Wed, 12 Jul 2023 04:14:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A410F61726
        for <linux-mips@vger.kernel.org>; Wed, 12 Jul 2023 11:14:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 964B6C433C9;
        Wed, 12 Jul 2023 11:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689160469;
        bh=Y6+HL5cXUR8pbarN3p3+VttPH3gHnNQ6XxPid37hCR8=;
        h=From:Date:Subject:To:Cc:From;
        b=Ldqv88QBLV2MDVWXgVYjElfKL8Ym4/H4j1R72PcSdBA47TCiesI7tIawH0QYyTOmS
         6E3hcwsrAUAq5WuoL+/Bi/cRmA4aoOIUU2LDqtmcXZIQ6b1QVYuMhwZKAuQ3/9S8xf
         nhxzgXyomqJGU9nE6nDV1BjU0LjnSFKRgziPysotee0zozTWajkZXV3L2rWenGqJfS
         yOO8DKC9mzNYIfyfq21Xbr6gyySIcLJVI+5wnIGJxFshLVsyHED5QWN8zbzYNDoTYG
         C4pqrAaT3+neX66FqV8rR/TVz2sYhvUE1DwQV6UIrGcASNW3NHsZI//PBKY/cV/fxq
         SIBkfxqr295eg==
From:   Mark Brown <broonie@kernel.org>
Date:   Wed, 12 Jul 2023 12:14:21 +0100
Subject: [PATCH] ASoC: jz4740: Update to use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230712-asoc-jz-maple-v1-1-3f745adf96e5@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAyLrmQC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDM2MD3cTi/GTdrCrd3MSCnFTdxMTkpBTjREOjpCQzJaCegqLUtMwKsHn
 RsbW1ALVL6i9fAAAA
To:     Paul Cercueil <paul@crapouillou.net>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     linux-mips@vger.kernel.org, alsa-devel@alsa-project.org,
        Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1266; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Y6+HL5cXUR8pbarN3p3+VttPH3gHnNQ6XxPid37hCR8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkrosSuIhZE5wvoRzAMzl6sL27d0C6GMGOFJkPp
 pIcVPbuyaOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK6LEgAKCRAk1otyXVSH
 0NQOB/90p5zjN4/f2/gVe1vaYj6jbmlPlBvsMyZ1tPF/Livlnts9y86UQND71L8jqGX91OYF3Cw
 9o5GwxqBULj0CvmiJngv1Ek43dQxgOb15XWPkWMIw+erYWjeExLWJt3A3UK0rhlwooQ3MoILrih
 qbTXJfINuBLDV34hpA9I0NQFYtfR8wFuJmIzrcc/aJQDFEbNtaW+ovRPMPlVN3znQq9I+xZrkqv
 hGBjRhYD2ysR3NTK/lGGKKqcl3q9ZXZknwZ2AlvgTX46kmApfx5s+Dmn42YKqujjlU1asnp5uHi
 Y/oKKFVYisgJWkbvx0Y6eR7l2DK2XsRe3Xy2MVt7OphWnQag
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the jz4740 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/jz4740.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/jz4740.c b/sound/soc/codecs/jz4740.c
index 7c25acf6ff0d..d1cea93bdb59 100644
--- a/sound/soc/codecs/jz4740.c
+++ b/sound/soc/codecs/jz4740.c
@@ -301,7 +301,7 @@ static const struct regmap_config jz4740_codec_regmap_config = {
 
 	.reg_defaults = jz4740_codec_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(jz4740_codec_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 static int jz4740_codec_probe(struct platform_device *pdev)

---
base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
change-id: 20230630-asoc-jz-maple-aacbd3a12bb6

Best regards,
-- 
Mark Brown <broonie@kernel.org>

