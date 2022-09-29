Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B98D5EEECA
	for <lists+linux-mips@lfdr.de>; Thu, 29 Sep 2022 09:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235197AbiI2HU3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 29 Sep 2022 03:20:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235211AbiI2HUR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 29 Sep 2022 03:20:17 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BEF825CD;
        Thu, 29 Sep 2022 00:20:09 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id bq9so724343wrb.4;
        Thu, 29 Sep 2022 00:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=IuNOeS9srf+1Q/WCpKXlVjtQm23vDazfm/4+R/GeDXM=;
        b=coBRVTiw2INwIetKj8xNUa8m6gmNqE+JdmpF8AOC1xY7aIhN8h1R56Du1J6vAd5s92
         7yhmMTgTOadhy/MYYQC8fabV5QVgzdedhOmYVnacltlLRj48FYYitZsBceaXgGARYKre
         38Q8Jm0ac0Q3O5eWQf42fWv4Oy7kKT//VZpOGhyRB1CKg3NgAuMuqTOT65U4+tiVgEd5
         7VqgCFgh/BgV7PxDyatJGP8lXqe8OktTQOP7HBGG2skqnGpjnuKYUpGDtXBLKEKHVKP+
         D1A3KxUqelAarsepHt6C/caQfZsiu+FXYrWK9fPJy2xFXaZgSxQB1sCZcoq9dCl0kqt8
         hNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=IuNOeS9srf+1Q/WCpKXlVjtQm23vDazfm/4+R/GeDXM=;
        b=af5l1PHY032gcfMGvMK7Mov48HKZjpzqH8F/JqNteAAPgx7yDSgyZtZKXuP0oS8lg+
         DoHm3gipHQdkgUdzRgbKSwMer0mFZykq2eeFOSUAPnpc8Ja07LgFVkTzVo6d39GzuKul
         tFXL5HKIwsAF2Lgigd/KmXmrTa/sDlXg5I4n2MMh7WzoV2Rm7EBZ1ISWFV12Iz7dzVG+
         xlm73eDyXOtx84TBcwTGbT50sMIpyCUGBBhp888ef8wm77e4U53V6mM3R6A16CLvNTNt
         1ZAKJ7dzO4hjhFDWiaFjWILoOrYwANzWAQD2m1d+n3VCsOWxqWcR5A0xkR4wPR+bIGUx
         IYmQ==
X-Gm-Message-State: ACrzQf2l2RCzpEaLM5wWmnAtPge2bFWAiIukL7MxsxQ8PFYuibgP1Mnj
        dO3htQsIYcNWZQuXjuYChekO4R00No0sCw==
X-Google-Smtp-Source: AMsMyM4RCOZWp79bhjE+Ri71IHlA4V+pfgfO53C1a2q4Bxjx8hGv8LX6Li4MsERnAQQbMEax0CSCig==
X-Received: by 2002:a05:6000:186d:b0:22a:45a3:7935 with SMTP id d13-20020a056000186d00b0022a45a37935mr1041657wri.209.1664436006870;
        Thu, 29 Sep 2022 00:20:06 -0700 (PDT)
Received: from localhost.localdomain (188.red-88-10-59.dynamicip.rima-tde.net. [88.10.59.188])
        by smtp.gmail.com with ESMTPSA id q63-20020a1c4342000000b003b4bd18a23bsm3674250wma.12.2022.09.29.00.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 00:20:06 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        linux-mips@vger.kernel.org, arinc.unal@arinc9.com
Subject: [PATCH v3 0/3] dt-bindings: mips: add CPU bindings for MIPS architecture
Date:   Thu, 29 Sep 2022 09:20:01 +0200
Message-Id: <20220929072004.874795-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi all,

This series tries to make the correct thing to represent in schema
all the current documentation related with MIPS CPUs.

Current 'arch/mips/boot/dts' folder dts files are a bit messy 
for cpu nodes, so I set additionalProperties to true and only
make required for 'compatible' in mips/cpus.yaml schema.

Broadcom cpus node is a bit special and need to use the property
'mips-hpt-frequency'. Since 'compatible' string is not in the
'cpus' parent node itself, we need a way to filter this to be valid
only for Broadcom SoCs. To make this possible I have introduced two
new schemas:
 - One to describe the Broadcom SoCs and its compatibles.
 - One to describe the BMIPS CPU's referring inside to 'brcm/soc.yaml'
   and 'mips/cpus.yaml' schemas.

Another thing to notice is that the root-node schema requires 'model'
as property and there is no model at all in any real DTS file for any
cpus node in 'arch/mips/boot/dts'. I have just added it in the schema
sample to avoid the following check fail:

/: 'model' is a required property
From schema: /home/sergio/.local/lib/python3.8/site-packages/dtschema/schemas/root-node.yaml

Don't really know if this is a way to go.

Thanks in advance for your time and comments.

Best regards,
    Sergio Paracuellos

Changes in v3:
- cpus.yaml: 
    * address Krzysztof comment in v2:
       * add Thomas as maintainer since this is architecture binding.
       * s/cpu/CPU
       * compatible goes first
   * Add compatible 'mips,mips4Kc' as per Thomas request.
- Introduce two new schemas for Broadcom BMIPS:
    * soc.yaml: describing the BRCM SoC's
    * brcm,bmips-cpus.yaml: describing the cpu nodes for this platform.

Previous series:
v1: https://lore.kernel.org/all/CAMhs-H-eUTOHjAXAbywOXQJgc_j5Ex-1sB7eBZU_bWt1fpNVzA@mail.gmail.com/T/
v2: https://lore.kernel.org/all/20220918112245.GA5555@alpha.franken.de/T/

Thanks,
    Sergio Paracuellos

Sergio Paracuellos (3):
  dt-bindings: mips: add CPU bindings for MIPS architecture
  dt-bindings: mips: brcm: convert Broadcom SoCs to schema
  dt-bindings: mips: brcm: convert CPU bindings for BMIPS architecture

 .../bindings/mips/brcm/brcm,bmips-cpus.yaml   | 102 ++++++++++++++++++
 .../bindings/mips/brcm/brcm,bmips.txt         |   8 --
 .../devicetree/bindings/mips/brcm/soc.yaml    |  97 +++++++++++++++++
 .../devicetree/bindings/mips/cpus.yaml        |  66 ++++++++++++
 4 files changed, 265 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mips/brcm/brcm,bmips-cpus.yaml
 delete mode 100644 Documentation/devicetree/bindings/mips/brcm/brcm,bmips.txt
 create mode 100644 Documentation/devicetree/bindings/mips/brcm/soc.yaml
 create mode 100644 Documentation/devicetree/bindings/mips/cpus.yaml

-- 
2.25.1

