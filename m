Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 857525F601C
	for <lists+linux-mips@lfdr.de>; Thu,  6 Oct 2022 06:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbiJFE3y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 6 Oct 2022 00:29:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbiJFE3w (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 6 Oct 2022 00:29:52 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D12812638;
        Wed,  5 Oct 2022 21:29:50 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id f11so781871wrm.6;
        Wed, 05 Oct 2022 21:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=9s2tzboryl2+Puelvtai2lv3sQFJY6915SASWppW61I=;
        b=Qc9EU/ElbL3uTXeizrHSg9RhHmRRSYWpRWxRdi7j+uak2auYcuBahoN9GzK+gm+YMp
         iRajNeEYJGJiYwBH3m+b6WvtTFK+IRPDI+5M1ZeArneicGkAQHW8RTgGKSGNlKcwnlQU
         h42LPyd/vaLw5g0mWoxLy81wCjf0fq4cqWAIoCSo/ey074hF2ZRAYW/VCUdJsCCagP4G
         Yn2Ud9FklnKJ4VpMidyig/7lpWg3g6GBm66nUXF7gS8qhPwlVHc59VPeLDTzovaen6F6
         QZQyqwbS8WoLn8fv3aFauMkzB5l8oMeRYF/6ssk5GTM/SfXATYDQdNE0b2f0vtMPVqFF
         T7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=9s2tzboryl2+Puelvtai2lv3sQFJY6915SASWppW61I=;
        b=u7JZk33GVxeQhlYapjYeR48IJWXPuaAwZZ7HJW+HOnbvAj/O2nryTCHVajISwR6bGt
         ZxrTyklNgkNge24usSu7l0n5EWNYpqe3T3pwQMlEUUvWLk6O8vjev/hxlcMjMYoB1Lty
         Ssj6U3g58eKw+AXMOfRkbe5QqhPiRNi9bw/cpcqONSagdT5giLpm1mdx6O68wI7nhNmg
         nbtVQk7+l5YwiHdo0vrR3waSmBZ1dr1gXLM4bMBkTSE48KJpjFxtOBVs8H4esTsZLawY
         nGTLvnhfGuuUWJm6yRrIZ/U5xX3vsLh2T+enQ23UevmFjF32+jTB1LjeXE5nzJsT0kmB
         T54Q==
X-Gm-Message-State: ACrzQf01C2rcWhvkT2ItXSQJ1uxNw4IFomkfcaFDAdBDDsZC8GBZD1Rz
        pK6eHcSx3285bDkEGVSIZiz05jkr+nnPbQ==
X-Google-Smtp-Source: AMsMyM6FqVL4/z5vO9wAzbrJOzew7QZEABwcTjLIWEZvMJjE0ZU+yFjYENFBXuDXUGbjewrjcBYhXg==
X-Received: by 2002:a5d:4889:0:b0:22b:214:38dd with SMTP id g9-20020a5d4889000000b0022b021438ddmr1814497wrq.32.1665030588690;
        Wed, 05 Oct 2022 21:29:48 -0700 (PDT)
Received: from localhost.localdomain (188.red-88-10-59.dynamicip.rima-tde.net. [88.10.59.188])
        by smtp.gmail.com with ESMTPSA id o11-20020a05600c510b00b003a83ca67f73sm3917017wms.3.2022.10.05.21.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 21:29:48 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        zhouyanjie@wanyeetech.com, linux-mips@vger.kernel.org,
        arinc.unal@arinc9.com, f.fainelli@gmail.com
Subject: [PATCH v8 0/2] dt-bindings: mips: add CPU bindings for MIPS architecture
Date:   Thu,  6 Oct 2022 06:29:43 +0200
Message-Id: <20221006042945.1038594-1-sergio.paracuellos@gmail.com>
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

Thomas, are these patches going through the mips git tree?

Thanks,
    Sergio Paracuellos

Changes in v8:
  - Remove Hauke Mehrtens from brcm/soc.yaml maintainers as per Hauke Mehrtens's
    requested in v7 response.

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

