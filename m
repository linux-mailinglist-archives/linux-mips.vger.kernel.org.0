Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59B9E734337
	for <lists+linux-mips@lfdr.de>; Sat, 17 Jun 2023 20:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237121AbjFQSxs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 17 Jun 2023 14:53:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236044AbjFQSxr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 17 Jun 2023 14:53:47 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C3471BD6
        for <linux-mips@vger.kernel.org>; Sat, 17 Jun 2023 11:53:45 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-bacfa4ef059so2553602276.2
        for <linux-mips@vger.kernel.org>; Sat, 17 Jun 2023 11:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687028024; x=1689620024;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=v9wz8DeYB1VRKdoZOdhaX76pipyCc2xYh6KEqelvXEQ=;
        b=y0QPAsr7+gnrwL0g+1qjBXf9KXrXYLjTGYeIxSnxMbwqG7DTk1/6TPGrIu++wIUR3c
         ujpC/9xRV9cFyVJEFdSvQic2O/rXcPaU9WD5P7lAOZCPTah14ObgieaeAZWaIOV0DDVc
         qP0zb6ML/akefuumsjaBLiqnc0bgHiZtdl9mp+zS4WVkEGcFNxDTLRR6ukMMf7N7fx7K
         q4VWHDX3oS5Aq3WW3Jpdn8WrlO/hUAx+09tZu6Qszra5IwydhkTBmSHEgCVJIL1puQ6U
         snkVHeqUrI6MNYfrBQ836aVjCAALxGQy7nqa0xlFslO2ldqS8tCNXhcBroRIjuJtM4+L
         ROLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687028024; x=1689620024;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v9wz8DeYB1VRKdoZOdhaX76pipyCc2xYh6KEqelvXEQ=;
        b=T9gbxScgogL4I/a0jtu1ON8pfrDoic64IbcXh8XAT7FM4M1Jjymva8f/Q3JAMAQ5og
         UFia2P4bJ6eCJsXvIS/8FedeQjfpyEymmmvpVAoSUaUBUc3cYylZCzqGp9Cr7tspps5V
         nI14+wzCFujJcOxC/qBfm/lBGTVM8TQUAbihyrTxIH3FVVDWuJGbjixICHLzlhg9t2vg
         AA8VSOuHG4KOqJg4nWU3bbUTW5kRZ+VBkFWQSsah7I4xaZA5qLKGlBo6ED9ZIklHvD/F
         QXujHPpKsz6M3CeZsBmSI+f1/Jxys9i04guhz7eUtU7s1hSWiPxyRh63YDjTPDXYFP4v
         EPPg==
X-Gm-Message-State: AC+VfDwu41S1c7zgJRE343xMOsuxnQ9rr0jLA416xnAYO3WxznU9qCmC
        eX4L+RsyYRskcFAsQpSJZ9zpXkZ4J3o=
X-Google-Smtp-Source: ACHHUZ5Guo1Ew/X9fcAmGhw5DfcdrKVlfjq+WYA4ggXBBRVzdOQkGF+5W6Rqp55PHznBkr9Su7YwhBt1I78=
X-Received: from yuzhao.bld.corp.google.com ([2620:15c:183:202:34d4:3c04:f9ad:8dfd])
 (user=yuzhao job=sendgmr) by 2002:a5b:743:0:b0:bc7:7012:fec7 with SMTP id
 s3-20020a5b0743000000b00bc77012fec7mr1455321ybq.9.1687028024161; Sat, 17 Jun
 2023 11:53:44 -0700 (PDT)
Date:   Sat, 17 Jun 2023 12:53:35 -0600
Message-Id: <20230617185335.2025859-1-yuzhao@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Subject: [PATCH] kvm/mips: update MAINTAINERS
From:   Yu Zhao <yuzhao@google.com>
To:     Huacai Chen <chenhuacai@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yu Zhao <yuzhao@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Aleksandar Markovic was last seen in Oct 2020 [1] and cannot be
reached for multiple days because of "Recipient inbox full".

[1] https://lore.kernel.org/all/1602103041-32017-4-git-send-email-aleksandar.qemu.devel@gmail.com/

Signed-off-by: Yu Zhao <yuzhao@google.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6992b7cc7095..9de60ba04b6d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11379,7 +11379,6 @@ F:	tools/testing/selftests/kvm/aarch64/
 
 KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)
 M:	Huacai Chen <chenhuacai@kernel.org>
-M:	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
 L:	linux-mips@vger.kernel.org
 L:	kvm@vger.kernel.org
 S:	Maintained
-- 
2.41.0.162.gfafddb0af9-goog

