Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3980135EB47
	for <lists+linux-mips@lfdr.de>; Wed, 14 Apr 2021 05:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233099AbhDNDNo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Apr 2021 23:13:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232933AbhDNDNh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 13 Apr 2021 23:13:37 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C1D2C061574;
        Tue, 13 Apr 2021 20:12:50 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id lr1-20020a17090b4b81b02900ea0a3f38c1so2320306pjb.0;
        Tue, 13 Apr 2021 20:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fhzJXag0MgkeERLQw7fwgTTLcexMxRw26VdF4LhuleQ=;
        b=Hh3pRhf8wPcxqp/UcS84bf1IxfWOHUUlJpJtpf1ENaA/ba52PIrrUMXHwOvCz7l111
         u+2jadQFZXkY7veHjQDaevPOEFwgNjmVdZ5JxwFN6Lc2hpOfRcRwNPd35+M+6YuHoBJC
         s4zh/xf3fYvizCQJ6y5msTlqTziaFK+4sxHX2XJFbnM2aqv6m4eCaO1iDonsF8dE5vBL
         lAdXD7r43tM8unpmaevt6VX+RY4g/tS2CH87yc/hdjFC8iZZKgFZW3Fht++753kFDrwN
         BkNY3fQSGw/Yvu2OAES8iwP27R8j63XjzoN1yfz8hVlpU6ow3U9Pvf4pUu+dDQiyP51e
         4LmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fhzJXag0MgkeERLQw7fwgTTLcexMxRw26VdF4LhuleQ=;
        b=lojUJHqTqdd50mHvosmvRAxvAC2aq1vTSxOvoKryOY84g7HD9uO3x/cJy1SVRgUvcG
         M9u/5ByK/yPW/6hLboSzj4QDDT11PdS06wsGL4Chi1Xboa91GSVCJKblKUthjJHMpk3R
         IbZQfTAs83oWw7Wg8hONuAKCFeveaEAgkF5j2AatfBs0An0sdNt9mtdoUl/7s2c4X3oC
         7yIhaPtTI3Oi8ERfi30iKMx0kxa6jpnDa2E6pVcSTBO/InO4JMKjjwfuioqZW96u18hd
         u4MUZAfHpYFLkiI1XTEWlE7135LiMaqLMp5xii1c7SQneruznIb1mjlqf7N9GKLYP0ol
         xPag==
X-Gm-Message-State: AOAM5330k8Ud4cq3qMNtjCjZVdTxqhWnZT4hZaAFEsSj4I9KVIwnKH/o
        fIVkZXoIwXWdfLYme/nuFk4=
X-Google-Smtp-Source: ABdhPJw5UWpLIIrff4YKIQPJiJSLCmmSNF5m51zEs94yK4VWtXsneKsJk0RfQSvkxXbajXbjNjiUjA==
X-Received: by 2002:a17:90a:9404:: with SMTP id r4mr1068735pjo.64.1618369969722;
        Tue, 13 Apr 2021 20:12:49 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
        by smtp.gmail.com with ESMTPSA id d17sm13971605pfo.117.2021.04.13.20.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 20:12:49 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>
Cc:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH v2 0/8] MIPS: fixes for PCI legacy drivers (rt2880, rt3883)
Date:   Tue, 13 Apr 2021 20:12:32 -0700
Message-Id: <20210414031240.313852-1-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

One major fix for rt2880-pci in the first patch - fixes breakage that
existed since v4.14.

Other more minor fixes, cleanups, and improvements that either free up
memory, make dmesg messages clearer, or remove redundant dmesg output.

v2:
- Do not use internal pci-rt2880 config read and write functions after
  the device has been registered with the PCI subsystem to avoid races.
  Use safe pci_bus_{read,write}_config_{d}word wrappers instead.

Ilya Lipnitskiy (8):
  MIPS: pci-rt2880: fix slot 0 configuration
  MIPS: pci-rt2880: remove unneeded locks
  MIPS: pci-rt3883: trivial: remove unused variable
  MIPS: pci-rt3883: more accurate DT error messages
  MIPS: pci-legacy: stop using of_pci_range_to_resource
  MIPS: pci-legacy: remove redundant info messages
  MIPS: pci-legacy: remove busn_resource field
  MIPS: pci-legacy: use generic pci_enable_resources

 arch/mips/include/asm/pci.h |  1 -
 arch/mips/pci/pci-legacy.c  | 57 ++++++-------------------------------
 arch/mips/pci/pci-rt2880.c  | 50 ++++++++++++++++----------------
 arch/mips/pci/pci-rt3883.c  | 10 ++-----
 4 files changed, 35 insertions(+), 83 deletions(-)

-- 
2.31.1

