Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A4185F19D6
	for <lists+linux-mips@lfdr.de>; Sat,  1 Oct 2022 06:39:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbiJAEjB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 1 Oct 2022 00:39:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiJAEjA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 1 Oct 2022 00:39:00 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 724AE1A59B1;
        Fri, 30 Sep 2022 21:38:59 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id ay36so4031711wmb.0;
        Fri, 30 Sep 2022 21:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=gZW8jdsKyRcJbqJXk/x6AVEZeo1ySQGjL55aNCUG+xs=;
        b=HZ1BxNeaqQmKFdCSQl7mRh5oc+VwfcAybuo29cixZc9KL6TSGjYsBiWUQdUA3B+eX7
         Z+DVI/PfD7kMmvG7BDvYKDgL/5bqKu+LHKedFWMha1gQNjZdHhPobqaDGlVbdfEIdNYt
         +GUuB65icoR/0R2xf1xzl7RWjRLnNK6pSz6Q3Mon+gsiDIIxHYpK0iG/WEaL68u1wyJ3
         veE/ny4H4Vo6f2bBd/sv5WdDqRlyRuE7prDvDUK6xqSGkm3kfx6GuX5fnQDT2TRN0KLr
         gyjYhMxQsKeVfugnNCvNqu/n33ceEnWDb/jOzgSg4f+I9InojWbyjX4O4yXOxaJlKaCy
         f1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=gZW8jdsKyRcJbqJXk/x6AVEZeo1ySQGjL55aNCUG+xs=;
        b=WfCap3esg1Qf3J2QuunGbxxQNRdbLp1Pyz0Nj9MsIsETG3HH2q7RB4E3SxuONlKhOS
         tZiX2iqFoJ4fuIerHSoxu3EFwtLAX74Y85EtXnQevrXF4tJ/PyEVxqcXm51UCtJZtM6C
         huy+B/XTAxtFGm5fhFYJ1CALu+vAnmP5PxgWav8aQs1sA8bEFDAKau1JV/coRS3+uxC2
         2riCBVE7/iv96KL+/NNtKgQTvwvTvO/+NiEpASst9LEnjgyybkhVrG9ALZmLIJLqCp0i
         yJ123vLoBosc9YNLS4V78onuLeeck1dLW0uWQawoTxRyFyzUN2XrOsk+5ki5VVs4Tphm
         gApw==
X-Gm-Message-State: ACrzQf3cLufRnzaTBNvT7wJYrQo+CVn6Qe8HBv4Jxi7SeufKvNFa/lTu
        DcMjfAGJMsJ718Rc7Qymu4kzfE9ZsAiHtg==
X-Google-Smtp-Source: AMsMyM4DJ9eNT0MVn8gutxwi4lrZkp7Loi3Eyri1bVDKEBozVY0S7M0+mNBvzRJ63F47is5/prLAPQ==
X-Received: by 2002:a7b:cb41:0:b0:3b3:34d6:189f with SMTP id v1-20020a7bcb41000000b003b334d6189fmr663269wmj.6.1664599137386;
        Fri, 30 Sep 2022 21:38:57 -0700 (PDT)
Received: from localhost.localdomain (188.red-88-10-59.dynamicip.rima-tde.net. [88.10.59.188])
        by smtp.gmail.com with ESMTPSA id m64-20020a1ca343000000b003a6125562e1sm3996206wme.46.2022.09.30.21.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 21:38:56 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        zhouyanjie@wanyeetech.com, linux-mips@vger.kernel.org,
        arinc.unal@arinc9.com
Subject: [PATCH v4 0/2] dt-bindings: mips: add CPU bindings for MIPS architecture
Date:   Sat,  1 Oct 2022 06:38:53 +0200
Message-Id: <20221001043855.933528-1-sergio.paracuellos@gmail.com>
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

Sergio Paracuellos (2):
  dt-bindings: mips: add CPU bindings for MIPS architecture
  dt-bindings: mips: brcm: convert Broadcom SoCs to schema

 .../bindings/mips/brcm/brcm,bmips.txt         |   8 --
 .../devicetree/bindings/mips/brcm/soc.yaml    | 110 +++++++++++++++++
 .../devicetree/bindings/mips/cpus.yaml        | 115 ++++++++++++++++++
 .../bindings/mips/ingenic/ingenic,cpu.yaml    |  69 -----------
 4 files changed, 225 insertions(+), 77 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mips/brcm/brcm,bmips.txt
 create mode 100644 Documentation/devicetree/bindings/mips/brcm/soc.yaml
 create mode 100644 Documentation/devicetree/bindings/mips/cpus.yaml
 delete mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml

-- 
2.25.1

