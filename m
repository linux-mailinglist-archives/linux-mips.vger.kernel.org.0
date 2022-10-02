Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD5C5F2237
	for <lists+linux-mips@lfdr.de>; Sun,  2 Oct 2022 11:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbiJBJQS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 2 Oct 2022 05:16:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbiJBJQR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 2 Oct 2022 05:16:17 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C5A73846D;
        Sun,  2 Oct 2022 02:16:15 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id u10so12695175wrq.2;
        Sun, 02 Oct 2022 02:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=IoTDjeH2PL5sJ8CiAttBoW5Xk9ebo28BlMjS3T+NzbE=;
        b=L9sIj4Qr/mkXGGPqjYd9VbhE0riq6DY/NcmQ4meanxx1kBc8bPPUwQ+Uv5JPBgz7g2
         gwo4Agrm1kge2q+/vt5a/TWetgnBm9SkflQNAmbYWUYo3zRsDPau2UM8D/cZy8FtdWWX
         8hIvx85ms/U0lqc5P+s7jdnuBC5yaYNYjdrdX1wolR9j8Zjgjq6sAZ7B8cSaJzLK+X3n
         wvaq/QjIzfW9P3Nv8f8yvUWEev1RW+Ec5sA2Ue+kDPw7YlUfQzKO1lXNnRuSQCGLpxX3
         VYmT2ikqbzrgvu4F0aDqpYhbfWpw23iCM5Vd+1D0WFNPA1/O4/+KqUHpvnV8+C1N4yH0
         u/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=IoTDjeH2PL5sJ8CiAttBoW5Xk9ebo28BlMjS3T+NzbE=;
        b=K4ZoKfQttbmrTMnGlB/FCuqlfgyPqdSDW7oKQVycnc119wRTvb+SPAAAXnwmtV4ZRl
         cbt0GeaPTJBvgxx031Ga3jJ/KTvn94cScfWjHBMgzyH4IFADY4Ixz0GZ2VnBHIH6gDza
         eF7bEQB82KNIDvp0v84+Y6WpEraYy8+UeWhc0CdRGRa9+jnKyqZqz+S8HzA+uxnEmvoF
         rMi4YIzlF9lqLzIJueDQtiHPL4J6LY1YV6I1K6jSUqnDx3vB7XtvfI3GdYmxej2EqozZ
         W0EGDv4W0/dGQs2VZLltnDDqWxZwXkxhQkwrFEZFH/4HDgz0WUx7AbvyGUHylq6LFlxR
         TmHg==
X-Gm-Message-State: ACrzQf3wcpHMuCpY78rCI+TpcdauRklqMAp7ldxMgbzwjB8Ugl8Ibz4r
        ltD5MwCqyJg5Pdb4W+FPT5KWE80BsG8W8A==
X-Google-Smtp-Source: AMsMyM7hnUnWvsN+NMOCXuLrGm9o8KqU6ERnlzXvDzKqHTUw9PeKpNmVhUASHzcbe1Z/q9LbfLub1A==
X-Received: by 2002:a05:6000:1e01:b0:22b:cee:e927 with SMTP id bj1-20020a0560001e0100b0022b0ceee927mr10149871wrb.133.1664702173784;
        Sun, 02 Oct 2022 02:16:13 -0700 (PDT)
Received: from localhost.localdomain (188.red-88-10-59.dynamicip.rima-tde.net. [88.10.59.188])
        by smtp.gmail.com with ESMTPSA id bs11-20020a056000070b00b0022a2bacabbasm7107638wrb.31.2022.10.02.02.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Oct 2022 02:16:13 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        zhouyanjie@wanyeetech.com, linux-mips@vger.kernel.org,
        arinc.unal@arinc9.com
Subject: [PATCH v5 0/2] dt-bindings: mips: add CPU bindings for MIPS architecture
Date:   Sun,  2 Oct 2022 11:16:09 +0200
Message-Id: <20221002091611.946210-1-sergio.paracuellos@gmail.com>
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

Changes in v5:
  - Address Krzysztof comments in v4:
      - change BMIPS SoC compatibles into an enum and drop descriptions,
      - Add blank line.
      - Redo commit message since it is not a conversion to schema.
      - Drop 'device tree biendings' from description.
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

Sergio Paracuellos (2):
  dt-bindings: mips: add CPU bindings for MIPS architecture
  dt-bindings: mips: brcm: convert Broadcom SoCs to schema

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

