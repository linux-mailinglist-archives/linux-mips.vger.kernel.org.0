Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2E0A5F527C
	for <lists+linux-mips@lfdr.de>; Wed,  5 Oct 2022 12:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbiJEKVe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Oct 2022 06:21:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbiJEKVe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 Oct 2022 06:21:34 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B763760ED;
        Wed,  5 Oct 2022 03:21:33 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id a10so12908119wrm.12;
        Wed, 05 Oct 2022 03:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=jGzWZTm1twkV/gD7fwGJMBZWPyw2ND2/w08OME1lsWQ=;
        b=huQ4BXVlO5O72EZm8J5hRUUxVoY2oXvpTwgB2W8tqxqgmV6OPazlzCrRY97ycB56MB
         9wPwQ/x0Xgaj0QAmzAZij54bI1yAVA72JvzwXPIg3ecqynza28HZ1x5aoJ59hqOPtdgC
         5oUqehIns5EX5NJ0Fz/e6tnvcm4X6/VZ1oSXtT7rvLc0ynFsG32Ty6jAw2bPkmMu1K6n
         FRfpGD6YswmlfWxV3TqnHkv4L/B4FQH7DFdLMlilkyMJmADJieb8DSuX0hG9n4AffFnf
         mq1YWh9vybXFrSlHKumGJwdwv7K3JdaTFdpFxfq0bKfl1XGPFtObAxwTQhyXIAMLZug1
         F4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=jGzWZTm1twkV/gD7fwGJMBZWPyw2ND2/w08OME1lsWQ=;
        b=ai1dP1595z6Z6EkHH9+K69p5FAT2TW3xqVgVLAXYBDNc8UruNbMMgbr1BBRPVGV0QF
         /oau8EfsdLqAD3LHBts6LfvlXPCr41GVXNVSe4/K6g4jNQCLgDjs+Q2vMTePcpciO/fT
         BmNWMsn0jvvUIJ48YYNb00l+dh7hlA4pHG+tqBTKQaqDg3MFI8ZBSiRSDKPkPsaa5nW1
         f4WFsjevaW8UkKlMNK9leqfpvANQlPTLR8ch1QLTBgHYobJ+CA2uYFtGUlDbND/+76fI
         a/yB0IGX8x5L4js59d393eOe0HQvF8dPIepFOITt+2PSU3ylZqumunntWJV/2hj4xtig
         rH/g==
X-Gm-Message-State: ACrzQf1MjOV58fTFqAZS3qZ1JXq/HhNA+7DTiRpoZU7VR+iUCjnmQsCm
        TaX4gcyneIRcBlUJ9NX2pFcedE4bXTK7Ig==
X-Google-Smtp-Source: AMsMyM7saCaS8G5fhT69TLNMbCPZL8fF+53uBymTwiiCTPStDAoDECmqsn2rK1g+2AOAOgvopbGkAg==
X-Received: by 2002:a5d:688f:0:b0:22c:df1c:92cd with SMTP id h15-20020a5d688f000000b0022cdf1c92cdmr4851687wru.52.1664965291292;
        Wed, 05 Oct 2022 03:21:31 -0700 (PDT)
Received: from localhost.localdomain (188.red-88-10-59.dynamicip.rima-tde.net. [88.10.59.188])
        by smtp.gmail.com with ESMTPSA id az30-20020adfe19e000000b002286670bafasm4481702wrb.48.2022.10.05.03.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 03:21:30 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        zhouyanjie@wanyeetech.com, linux-mips@vger.kernel.org,
        arinc.unal@arinc9.com, f.fainelli@gmail.com
Subject: [PATCH v7 0/2] dt-bindings: mips: add CPU bindings for MIPS architecture
Date:   Wed,  5 Oct 2022 12:21:26 +0200
Message-Id: <20221005102128.1014468-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Broadcom cpus node is a bit special and need to use the property
'mips-hpt-frequency' in the cpus node. Because of this I have introduced
brcm/soc.yaml schema with current broadcom SoCs and making this property
required as per Rob's v3 review comments.

Ingenic cpus have also its schema already mainlined. To unify things I
have also put this information in this mips/cpus.yaml schema and remove
the 'mips/ingenic/ingenic,cpu.yaml' schema. I have also added current
maintainer as maintainer for this 'mips/cpus.yaml' file.

Changes in v7:
  - Remove Rafał Miłecki from brcm/soc.yaml maintainers as per Rafał Miłecki's
    requested in v6 response.

Changes in v6:
  - Avoid 'convert' in SoC's patch commit message since this is just an
    addition and nothing is removed in this patch.
  - Add Florian Fainelli to maintainers of Broadcom SoC bindings
  - Add Florian's Acked-by for broadcom SoC PATCH.
  - Collect Rob's Reviewed-by for both patches.

Changes in v5:
  - Address Krzysztof comments in v4:
      - change BMIPS SoC compatibles into an enum and drop descriptions,
      - Add blank line.
      - Redo commit message since it is not a conversion to schema.
      - Drop 'device tree bindings' from description.
      - Properly describe 'mips-hpt-frequency'.
  - Review cpus node and add a sample to check schema correctness.    

Changes in v4:
- Address Rob's v3 review comments:
    * Drop PATCH introducing special brcm,cpus.yaml only because properyu
    'mips-hpt-frequency' is required and move this property to brcm/soc.yaml
    schema.
    * Remove 'Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml'
    and add that information to general mips/cpus.yaml schema.
    * Define all properties in mips/cpus.yaml and set 'additionalProperties'
    to false.

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
v3: https://lore.kernel.org/linux-devicetree/20220929072004.874795-1-sergio.paracuellos@gmail.com/T/#t
v4: https://lore.kernel.org/linux-devicetree/20221001043855.933528-1-sergio.paracuellos@gmail.com/T/#t
v5: https://lore.kernel.org/linux-devicetree/20221002091611.946210-1-sergio.paracuellos@gmail.com/T/#t
v6: https://lore.kernel.org/linux-devicetree/20221004050924.986211-1-sergio.paracuellos@gmail.com/T/#t

Sergio Paracuellos (2):
  dt-bindings: mips: add CPU bindings for MIPS architecture
  dt-bindings: mips: brcm: add Broadcom SoCs bindings

 .../bindings/mips/brcm/brcm,bmips.txt         |   8 --
 .../devicetree/bindings/mips/brcm/soc.yaml    |  97 +++++++++++++++
 .../devicetree/bindings/mips/cpus.yaml        | 115 ++++++++++++++++++
 .../bindings/mips/ingenic/ingenic,cpu.yaml    |  69 -----------
 4 files changed, 212 insertions(+), 77 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mips/brcm/brcm,bmips.txt
 create mode 100644 Documentation/devicetree/bindings/mips/brcm/soc.yaml
 create mode 100644 Documentation/devicetree/bindings/mips/cpus.yaml
 delete mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml

-- 
2.25.1

