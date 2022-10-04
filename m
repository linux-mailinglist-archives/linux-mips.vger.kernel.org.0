Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31E9A5F3C56
	for <lists+linux-mips@lfdr.de>; Tue,  4 Oct 2022 07:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbiJDFJa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Oct 2022 01:09:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbiJDFJ3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 4 Oct 2022 01:09:29 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B65B83FA22;
        Mon,  3 Oct 2022 22:09:28 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id a3so7271217wrt.0;
        Mon, 03 Oct 2022 22:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=Fh57gthoTS5Zgxdli7FQN3AqdEzUekqMlCyvDG2iaR8=;
        b=CE53z6uX9MTmPQDwvn63hf7+xl6yPD1UEUwnMsu7rvgwyEBnDCujrC6u7ccR/xFOju
         681d5sd9asCowOVJSbFjB2JwoBLpTYuzrSHTpg4/nW413JAXjPteXzqNv+kkMVD1Ae2b
         D/kiVq5K4fBuOJcK0cPukeTQqF+ZKGZ3SACUmS8LR/U3DvNs6XxnWU8p8ZnBzohgbatS
         oyYgQ3LWwKaMehq+2UeuxVtR06hUvY+Jh5hgWcoBpE9VxYYO/0vdbdRqAiXCm8TJdHJq
         PCHSrlOq0/SYZQPuzUdl5fTuUz0NAnzkFGPceh8dz5tSeF7ylXquoUhBUISVOVEQ3evy
         nHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=Fh57gthoTS5Zgxdli7FQN3AqdEzUekqMlCyvDG2iaR8=;
        b=eVVste5HZw18nREgFnuqI8CeGJLTorUwdiCIi9yAHsHMqB9qdclQsHnsuFocURaDmN
         DhIHn6prBtkZPulUgkNZYdShFIK6q83bT5O8WfJsUphtWnrGkxkdb7iT4AbFcKJ4avSN
         fRD7svU+15spUzVhen8B/xg41DCXLzR/nSKFaazZOLDf6VnL5vhi6sIjA4elfjSyDjar
         ace+EOujctrS3BhrDQJ+1mDyVhpRuG2zNXul0+qJGxaJNnX+ae3N/zJajcGp0YOm0RAq
         Ppal20ydkdfep+TVwEIwzq/sNDSEFn/7InZsf32Roh+YKp/byaTni7Y1MIIcCzhyEzwy
         wZsw==
X-Gm-Message-State: ACrzQf2qhckG1Q4xmFBG/23sHJVtXm2OG44k8SIz4jTj6b7uhN50/W3v
        JZP9To9CZiJkideSyrbQvX6+f9S8BrSNTg==
X-Google-Smtp-Source: AMsMyM5hC906R8AfQvcn2AffsCYJN2WLqq6G+3TebWQE2HLgFyqiq+5frCyeF2e1EghByaDNwu6/mA==
X-Received: by 2002:a05:6000:1a8b:b0:22a:cb74:eaea with SMTP id f11-20020a0560001a8b00b0022acb74eaeamr15378394wry.253.1664860166848;
        Mon, 03 Oct 2022 22:09:26 -0700 (PDT)
Received: from localhost.localdomain (188.red-88-10-59.dynamicip.rima-tde.net. [88.10.59.188])
        by smtp.gmail.com with ESMTPSA id i4-20020a05600c354400b003b47b80cec3sm19854250wmq.42.2022.10.03.22.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 22:09:25 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        zhouyanjie@wanyeetech.com, linux-mips@vger.kernel.org,
        arinc.unal@arinc9.com, f.fainelli@gmail.com
Subject: [PATCH v6 0/2] dt-bindings: mips: add CPU bindings for MIPS architecture
Date:   Tue,  4 Oct 2022 07:09:22 +0200
Message-Id: <20221004050924.986211-1-sergio.paracuellos@gmail.com>
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

Broadcom cpus node is a bit special and need to use the property
'mips-hpt-frequency' in the cpus node. Because of this I have introduced
brcm/soc.yaml schema with current broadcom SoCs and making this property
required as per Rob's v3 review comments.

Ingenic cpus have also its schema already mainlined. To unify things I
have also put this information in this mips/cpus.yaml schema and remove
the 'mips/ingenic/ingenic,cpu.yaml' schema. I have also added current
maintainer as maintainer for this 'mips/cpus.yaml' file.

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

Sergio Paracuellos (2):
  dt-bindings: mips: add CPU bindings for MIPS architecture
  dt-bindings: mips: brcm: add Broadcom SoCs bindings

 .../bindings/mips/brcm/brcm,bmips.txt         |   8 --
 .../devicetree/bindings/mips/brcm/soc.yaml    |  98 +++++++++++++++
 .../devicetree/bindings/mips/cpus.yaml        | 115 ++++++++++++++++++
 .../bindings/mips/ingenic/ingenic,cpu.yaml    |  69 -----------
 4 files changed, 213 insertions(+), 77 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mips/brcm/brcm,bmips.txt
 create mode 100644 Documentation/devicetree/bindings/mips/brcm/soc.yaml
 create mode 100644 Documentation/devicetree/bindings/mips/cpus.yaml
 delete mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml

-- 
2.25.1

