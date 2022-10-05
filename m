Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C19665F50A3
	for <lists+linux-mips@lfdr.de>; Wed,  5 Oct 2022 10:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbiJEIKy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Oct 2022 04:10:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbiJEIKw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 Oct 2022 04:10:52 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1FA7726B9
        for <linux-mips@vger.kernel.org>; Wed,  5 Oct 2022 01:10:51 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id nb11so33803640ejc.5
        for <linux-mips@vger.kernel.org>; Wed, 05 Oct 2022 01:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=hTTIE+//RT3SQ4t1o8nNql7CUljxWdvVGSyDeJsuJHE=;
        b=ezTZy9765engBF70SEG/vr6zIFt8yC0old3jFcsvmtoCDPTZJJOowl2uFWm+/1Oxdp
         44QbmactckGEaCLudx1x/22EzADrM1JffMXY/pJb/gBJ3OZcvIU+UNpbGSpaWZjA8f5D
         HzzXp3GQaXuZ9fX/+lgIqCcA0fn954mSziEh2Nbt+cZEhBDLcegTU3MV2MdsfEk6AF55
         6yl86ghHrPQxQ8eavO1yfoXsZ5z3g3vf7q7oBzrP47aoRps+RwKBy4C6IdSszsfj0aE4
         mHFmeYo8AFiZtNzLPIzZeLeVPqtpK06AEV4QAN4dvvo4EbGtS4U59eh9NoQP6csthzCT
         vbsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=hTTIE+//RT3SQ4t1o8nNql7CUljxWdvVGSyDeJsuJHE=;
        b=gX5khC7zMhNHVwfijEAAk0zj+IKJ9bTJDwYU8dObT3mQY45WE/DEwKKU7q9/FNY9/3
         AHBv7Bt+3WkCrGLOuDtQ+K0bwM/MhIK5udI1sD1BEAYolg+OhVapteIqs1kBtMptUMB1
         Fb+YUN/SfvhBP8rNVVE525twJj/XScy1rer8RZAjldvST0uixURUzIOpu5xY0YjjzAM9
         +GPLFljmSfzBFObble8lZyd4xmuGTXiJEcQFxjnWZBIJr3JQ6ymaczzJDvuNUILPuIi7
         gXAHfFC3raKfhMi/SLR7a/47zLWFp/WKq/9ZBoge8n85zwb64Fda8IsZJMVBhfn9GpWa
         hXrA==
X-Gm-Message-State: ACrzQf3co3A/UKvnGCDbkodRN8pvIAvGid5yvebq/tNJy7G1LK/hSNuA
        atiJcv2n+oUZyV+6yVgRGIdr8oqk5+C+TzTadLNnUnwIUeBGag==
X-Google-Smtp-Source: AMsMyM4aGZhFh83kHsx80jblqmaYtZ8Wvm5MfMYm76fa40mV3IlJQraiGlBaKZl4tnoWitd1pV/O6mpdN4Av9M5gXZc=
X-Received: by 2002:a17:906:9b86:b0:73d:72cf:72af with SMTP id
 dd6-20020a1709069b8600b0073d72cf72afmr22561047ejc.440.1664957450276; Wed, 05
 Oct 2022 01:10:50 -0700 (PDT)
MIME-Version: 1.0
References: <20221005080615.2656309-1-linus.walleij@linaro.org>
In-Reply-To: <20221005080615.2656309-1-linus.walleij@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 5 Oct 2022 10:10:39 +0200
Message-ID: <CACRpkdYJ9mygGicHE9LFRApxT1RbDYufoZx48Bj1cisxOx=O_w@mail.gmail.com>
Subject: Re: [PATCH] mips: lantiq: Silence compiler complaints
To:     Ralf Baechle <ralf@linux-mips.org>, John Crispin <john@phrozen.org>
Cc:     linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Oct 5, 2022 at 10:06 AM Linus Walleij <linus.walleij@linaro.org> wrote:

> With recent GCC this warning appears:

Nah scratch that, it turns out I was using an old v5.10 branch for my
test compiles by mistake.
Sorry.

Yours,
Linus Walleij
