Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF77E7775FB
	for <lists+linux-mips@lfdr.de>; Thu, 10 Aug 2023 12:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235025AbjHJKjL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Aug 2023 06:39:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234928AbjHJKjI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 10 Aug 2023 06:39:08 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04D8010DE
        for <linux-mips@vger.kernel.org>; Thu, 10 Aug 2023 03:39:08 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-99bed101b70so110744266b.3
        for <linux-mips@vger.kernel.org>; Thu, 10 Aug 2023 03:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691663946; x=1692268746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjssVyu9VJwz+xDSDWNEHPUfzXNslCG23eueJNmPGQ8=;
        b=uqNJ1HX/qjQIexV2nf059Rdzb/vqdUAP7+BucQ7L2+H6Cv3YX4VzsYY2QdgUBz5zfw
         RqIgwEmU/2ZOhRu3NoQxtaPmwxFofNfW9LUb5IwQQs7enednpNFFYIA5KT3Yc9Kdwofv
         15SJTOYUrlVSwP3qf17oDTKcHc26PGvCDh4wGHdiDsX/xOZU8M2pXdp8Npgm8kpjNh2y
         mDHQRW4VFSrGvKVxO5APnSh54XKspyCJpbgznrvtOPMbWTb9c4S8oXFfmDUa/2l8jxNE
         0t/Fi8H4wBUqr9RsCnrlgBWsI2W9hW6UK3ceRzrIrmlQrclmH7TlrdEeKnIFFyvMm/dR
         eVpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691663946; x=1692268746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjssVyu9VJwz+xDSDWNEHPUfzXNslCG23eueJNmPGQ8=;
        b=Limc728/lZjT7+Fb8KwOElsyVi/BZKzcxru580sxtg3NKF68aK/Tj3kukxaBtODpRk
         fExGV9/8FjmbOg/Mh8lhiu6v2NQTcqoK+/Ei38fbtGCymaU2w+/b4wLy8fXBS/Lu5YuA
         fAwpDuQ3SIbpMJgMnNRsp4IS4rw6+90enY3TN9XZJkwhII3QJ8LkJSxRU5l/DYBrFHgs
         DjLcBXY5Lr/KGpDuX/ZkcxPRaUd+cBYzJ0Z53neNNYuEt4eehd7PSHtEI8uPw8Ns2jor
         U40wYCbco5/azDJsp4DTgp8QWJjA70QqJ4pqAnMGtIhCriHX+c36Yb1jlbS4Df31fyZ4
         PpLg==
X-Gm-Message-State: AOJu0YyrGsq6Ix1SCRz+2hxxT3ovTMgRzqBVv++SmmYCIamHgwe1Rbuo
        uBNmifRL/mE2XuKJ52dgto4I/A==
X-Google-Smtp-Source: AGHT+IGT/7vPszp+L5u5i3kb8y/saAj4/upC2TQoXFJR3H17BGkbKlbzLVtk7KUts7U7TQAQw1OGEg==
X-Received: by 2002:a17:906:1da1:b0:99b:f3f5:9752 with SMTP id u1-20020a1709061da100b0099bf3f59752mr1854481ejh.14.1691663946501;
        Thu, 10 Aug 2023 03:39:06 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id g11-20020a170906868b00b0099bca8b9a31sm742180ejx.100.2023.08.10.03.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 03:39:06 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Paul Cercueil <paul@crapouillou.net>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/4] rtc: rv8803: fix Wvoid-pointer-to-enum-cast warning
Date:   Thu, 10 Aug 2023 12:39:00 +0200
Message-Id: <20230810103902.151145-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810103902.151145-1-krzysztof.kozlowski@linaro.org>
References: <20230810103902.151145-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

'type' is an enum, thus cast of pointer on 64-bit compile test with W=1
causes:

  rtc-rv8803.c:648:18: error: cast to smaller integer type 'enum rv8803_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/rtc/rtc-rv8803.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index 98679cae13e8..c09d66f881fd 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -645,8 +645,7 @@ static int rv8803_probe(struct i2c_client *client)
 	mutex_init(&rv8803->flags_lock);
 	rv8803->client = client;
 	if (client->dev.of_node) {
-		rv8803->type = (enum rv8803_type)
-			of_device_get_match_data(&client->dev);
+		rv8803->type = (uintptr_t)of_device_get_match_data(&client->dev);
 	} else {
 		const struct i2c_device_id *id = i2c_match_id(rv8803_id, client);
 
-- 
2.34.1

