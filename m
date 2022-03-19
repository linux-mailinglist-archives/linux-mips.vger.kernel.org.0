Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 923B24DE6A1
	for <lists+linux-mips@lfdr.de>; Sat, 19 Mar 2022 08:11:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242341AbiCSHMg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 19 Mar 2022 03:12:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234579AbiCSHMf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 19 Mar 2022 03:12:35 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34D53266B48
        for <linux-mips@vger.kernel.org>; Sat, 19 Mar 2022 00:11:15 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id h2so11366311pfh.6
        for <linux-mips@vger.kernel.org>; Sat, 19 Mar 2022 00:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4h/Kp3l5Qx2R4JmUDB1nazjmLgl+xh7GPcfxH407yWk=;
        b=MGT93S+TNDnFpLxTOR1N1PvLmidCecq9+qzEa0IRcSwPNmNtzk6bsygUj8HUcXf452
         5sMqDfgbV2QQXHUP2ntoR7hd+u4zzO9qpsc6qMXUF171MkkLCZ2yGJNDn2UFlXP7BNhj
         WcoEJzXe5dt7KRh3ccL7JRnDl3HrQ7k6EhGFOVD0ka6N/sukntdRKGr0HdyYZy4BoeOK
         C35/1QUHdxpWgF5qXpoHZNIRP0zrPj5JpwqbZt5W9KU/hD6I9Cxm6r5eFK1woeuDYOTf
         Zf8sP0728DD2J6MQ6gGuBuEW5dhGBVUxe90qzrNNcUWsyq4bavdN3ByuiLIrsVn+mMtf
         AtoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4h/Kp3l5Qx2R4JmUDB1nazjmLgl+xh7GPcfxH407yWk=;
        b=6ZgsSp8NlidpNNfbNWK6z4FYKgq34C7F+rzrycezCkI/CD152Zf1/8AT+AEtkeKASi
         9BdVRNoZoaHJ6KyFJ+94QbOyfpZIiLbZmptt6/16h7K6Nh2l/Am83tK11eKuUKqNEWF6
         XMZp6uKeMSgJgOIZyJDETVeYWmcFsng93NY0hE0Y1Fo6XYim+ZaF8JUkFbtRgRiew7ik
         4tnQYFI61pTeyGuUgzkWxjLPXqy+rVt5qO1ZfvTYhSGGr6xi27hhFJY8BsjcUNDxFKjj
         fiAuG6WyyZ4mMs0wMmimgY1tGWql89u1oPoVcx5uDvOsbSMtn1ncMqIpT2E3QldIUPb/
         esyA==
X-Gm-Message-State: AOAM531UNQA7XxSbTASG0Cjpd83gODKN/Q4QAScNNhFDQYnYI/vSd1tH
        VKHHsVjVIU6mBJVpWd5mmkk=
X-Google-Smtp-Source: ABdhPJwXvH+i/WcK92MLjnMlHmA9m6aNA3aXd83YrYBNqRTV7/wbbaHExwk7AKLf6SPiRX/L5/46Xg==
X-Received: by 2002:a63:dd0a:0:b0:378:4b73:5b3b with SMTP id t10-20020a63dd0a000000b003784b735b3bmr10344318pgg.564.1647673874262;
        Sat, 19 Mar 2022 00:11:14 -0700 (PDT)
Received: from localhost.localdomain ([155.94.198.189])
        by smtp.gmail.com with ESMTPSA id u25-20020a62ed19000000b004f140515d56sm11497103pfh.46.2022.03.19.00.11.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 19 Mar 2022 00:11:13 -0700 (PDT)
From:   Feiyang Chen <chris.chenfeiyang@gmail.com>
X-Google-Original-From: Feiyang Chen <chenfeiyang@loongson.cn>
To:     tsbogend@alpha.franken.de
Cc:     Feiyang Chen <chenfeiyang@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org
Subject: [PATCH 0/2] MIPS: Fix build error for loongson64 and sgi-ip27
Date:   Sat, 19 Mar 2022 15:11:02 +0800
Message-Id: <cover.1647671808.git.chenfeiyang@loongson.cn>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Fix link errors after patch series "mm, memory_hotplug: handle
unitialized numa node gracefully".

Feiyang Chen (2):
  MIPS: loongson64: Fix build error when CONFIG_NUMA is set
  MIPS: sgi-ip27: Fix build error

 arch/mips/Kconfig                             |  4 ++++
 .../mips/include/asm/mach-loongson64/mmzone.h |  4 ++--
 .../include/asm/mach-loongson64/topology.h    |  8 +++----
 arch/mips/loongson64/numa.c                   | 22 +++++++++----------
 arch/mips/sgi-ip27/ip27-memory.c              | 10 +++++++++
 5 files changed, 31 insertions(+), 17 deletions(-)

-- 
2.27.0

