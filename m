Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BB8876A105
	for <lists+linux-mips@lfdr.de>; Mon, 31 Jul 2023 21:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230301AbjGaTUO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 Jul 2023 15:20:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbjGaTUN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 31 Jul 2023 15:20:13 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69862198
        for <linux-mips@vger.kernel.org>; Mon, 31 Jul 2023 12:20:12 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-26813478800so2960363a91.1
        for <linux-mips@vger.kernel.org>; Mon, 31 Jul 2023 12:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690831212; x=1691436012;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGAYQ6rkGNakus8aaZ27EffaPf8koLaE5zk7B3NOHKA=;
        b=GqB/qdhTxxyrpfgSKIpQh97Dk1UMHlEa6GMjIym1JR9gaxNdxDyTaOb+1j6YPM+RAj
         wE1c0gqZ1WTzXyVxGj3Zrtwhn3pCJmNXA6/P5ZJFm8uPywxskWxY/LvN6Te6q6L0yPCZ
         ZDxtAKINDmFEqEX2z5OH3bbFBTiIMl/7pgV9fL6ekXIZ0EzKKNLaPCO88YektkU4vB12
         QC4x+6FrJEDN0KVGAwi7ILcOwjN0OgsdSC5PTZ82SyiInHiQMGjQeKTZHMhyLtcxzqDm
         xjWSAkas0iJdFCGFj08qVu69OS3ytUfJKu9bc79AFsS/2zsPu1eAxr/xnEzHittALpvR
         T3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690831212; x=1691436012;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AGAYQ6rkGNakus8aaZ27EffaPf8koLaE5zk7B3NOHKA=;
        b=A54eZWgevY5chCt5kLtiAfMp9EvbZhYqBNIxNyryVC3wv4UjD4DQHXr1mT96kzklTO
         WIqTWcZunzIhN+f5sMXGrMG2U5+u/EcsUFVQCqnuxcNClISLeZK3eAh36RZVT4xTnIv/
         k6skJ/T12F818JrjozxnM7x3BgdrA4+vWg8Ojq2uiMItTSby+zP6UeE6KKckdBEerx55
         8FXOZMZ28ryYC5mHLDI8x/GsenA6abYzKuVtkErNrWS38jMwZQqyfGOe6GXMxP8oY2Bp
         JEck20yWQqIBXtIzYqNR/1Ou7B1pCff9u/U/sg1yrEuD7Z62fk22hP1cv+xaNdDrl10N
         hq7A==
X-Gm-Message-State: ABy/qLY5Y+OaSIUB8GIGnXdQNhMmfquKlYnfTlA6BRm6G1QNhbPaRk5u
        JvJn41jjbQrFT8bLL2eH411HNgslrhc0kudkRyE=
X-Google-Smtp-Source: APBJJlE9tXomkGDl6B+X5zzVamRr+k1A1H3T9g5qwZex8PsTkCtguD+GC8pFCyYdLyNmkGr4Ebb3T4QphnooKOSf4oM=
X-Received: by 2002:a17:90a:f318:b0:263:9661:a35c with SMTP id
 ca24-20020a17090af31800b002639661a35cmr10000687pjb.8.1690831211934; Mon, 31
 Jul 2023 12:20:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7300:7492:b0:dc:d560:dc43 with HTTP; Mon, 31 Jul 2023
 12:20:11 -0700 (PDT)
Reply-To: Dr.catherine_chan@hotmail.com
From:   catherine chan <williamsoscar698@gmail.com>
Date:   Mon, 31 Jul 2023 21:20:11 +0200
Message-ID: <CAM8NFUTFmqT-kq4q6JLKSBrz-uVg6sMQbmoDTZLYeQUnfNKN9A@mail.gmail.com>
Subject: Re:Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

-- 
 Hello! How are you? Please forgive me if my application is not
acceptable by your kind person, I saw your email and I want to talk to
you directly by mail. I would appreciate it if you could send me an
email when you receive it.

Waiting for your prompt response
Greetings,
