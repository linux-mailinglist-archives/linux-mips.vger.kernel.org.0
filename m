Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D6D462326A
	for <lists+linux-mips@lfdr.de>; Wed,  9 Nov 2022 19:27:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbiKIS1Q (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Nov 2022 13:27:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbiKIS1P (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 9 Nov 2022 13:27:15 -0500
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDDDE2DE8
        for <linux-mips@vger.kernel.org>; Wed,  9 Nov 2022 10:27:14 -0800 (PST)
Received: by mail-qv1-xf30.google.com with SMTP id u7so12853531qvn.13
        for <linux-mips@vger.kernel.org>; Wed, 09 Nov 2022 10:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3J4Rw98UL8fsxWhjz9DQR3MW69C7UFR3nP1wJIHN0ao=;
        b=nJPUGKDLr9BDx6yUjyMw6Z8eETfjJJiglsiNqxnZw9EYLf35XaZC8Y1ZkTH1Wle8RH
         xJsmlJvl9eWkZJfMFBFd8uq5vKlLZ3URmKb/+LEM7PnZ3ujuRDBitUoVZzXCpV5twjnv
         d4DetdD8Wh6BUp+qwOe2sXFhb/RvHz+/TeW6GFw/pkc3WcD6n5moknC2D14OuubUXzoN
         1/niFImtcrfLpZh1SimqWuZpda51HAubzLRVMOY/Gz6ywVbntvqqJOr+1jRL8aUrhNUk
         zAKsup9POLc9Tkmq+YovNMF7ciY/72wWo72GJhxphQAPKATwrZmcQjnKI6M26+V48UnP
         wg5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3J4Rw98UL8fsxWhjz9DQR3MW69C7UFR3nP1wJIHN0ao=;
        b=LiPpTiBuo+ZgXbLiOBkspPIYq4W88fTuki36C+53k4Mg29bSBsLyGe01dGBAUGDcJi
         tumKp/A7DMvWMAdT3F8hZKLFAM2CkjNUZhNP3fIecKfivuL5/rphVqn05Jkb2/DHpL7/
         IbXr5NsjeZWKfLewrWWnmhAe+vOxa1C5bIWIoCDB06wj/7EHyfduPNedJmfEpsX08NLd
         0/hAD+j82iBaGwwWVGwOQ+X63FxQtAng9EOtKFEIEs/FQCby8l6UPMQtpDX3yLUp4asW
         e9TuG/2EKE7eI7Y5Ya262yMGb5+Y4GVdGlldLVFEhzf7aztC8ubwkqgjoWzVXzMtuiCw
         2lAg==
X-Gm-Message-State: ACrzQf3bFsMSkjgtCxqwfcQBx92u/BmK1/eX8OB6cLDGW3+eiUeRPfo2
        5nkaB9npzoMEMksJ0ZXkUDY=
X-Google-Smtp-Source: AMsMyM7ovZjHw8zAtylVSHmb58SqEiKUA5JiEOD8Ytj2D7QwiTPjgvooe7SoAXlPWUNq11asMpmzKw==
X-Received: by 2002:a05:6214:21ce:b0:4bb:7392:c94d with SMTP id d14-20020a05621421ce00b004bb7392c94dmr55677562qvh.71.1668018433911;
        Wed, 09 Nov 2022 10:27:13 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id e1-20020ac81301000000b003a4d5fed8c3sm9925709qtj.85.2022.11.09.10.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 10:27:13 -0800 (PST)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     bcm-kernel-feedback-list@broadcom.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org,
        =?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>,
        Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: [PATCH] firmware/nvram: bcm47xx: support init from IO memory
Date:   Wed,  9 Nov 2022 10:27:11 -0800
Message-Id: <20221109182711.879969-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221103082529.359084-1-linus.walleij@linaro.org>
References: <20221103082529.359084-1-linus.walleij@linaro.org>
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

On Thu,  3 Nov 2022 09:25:29 +0100, Linus Walleij <linus.walleij@linaro.org> wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Provide NVMEM content to the NVRAM driver from a simple
> memory resource. This is necessary to use NVRAM in a memory-
> mapped flash device. Patch taken from OpenWrts development
> tree.
> 
> This patch makes it possible to use memory-mapped NVRAM
> on the D-Link DWL-8610AP and the D-Link DIR-890L.
> 
> Cc: Hauke Mehrtens <hauke@hauke-m.de>
> Cc: linux-mips@vger.kernel.org
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> [Added an export for modules potentially using the init symbol]
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian
