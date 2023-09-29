Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 103077B34B7
	for <lists+linux-mips@lfdr.de>; Fri, 29 Sep 2023 16:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233179AbjI2OSj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Sep 2023 10:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233210AbjI2OSj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Sep 2023 10:18:39 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 667D71AE
        for <linux-mips@vger.kernel.org>; Fri, 29 Sep 2023 07:18:37 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c16757987fso143038501fa.3
        for <linux-mips@vger.kernel.org>; Fri, 29 Sep 2023 07:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695997115; x=1696601915; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8j2Dqke+VIw3sY3uBi50vPFlbJnXICNf1WlSdn5wTHY=;
        b=FdC09uw+wc+TCnMNqso/naVcmHNbrI3d69FwNjniQ8/rOC2EIZx8XWo3MfQKoiKy4G
         CkdIf/BinSy1NGF3XJjDexq3EimtzcjvWSZ+WD9dc6OzeLpgFfx70bb7YHF3znP4mpGF
         Vy8le4E7pHWNElwO/uGRddicBw51s9jUClE0NQHYeN+HjuXZKMInk2iLgyrIb1x2LtTk
         WiAXY+24aLRPkFiFjSk7SVPw6d20uKt1TGlkKtyqwBLZJ1EccCET5tJc77SL9SHDiLQk
         uRosEypzoTgp4RyWEHGflFAOQRvTd4TtyV+xRz1WuRZhEP76WldEH21/NFz/F0JZ1jwF
         L3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695997115; x=1696601915;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8j2Dqke+VIw3sY3uBi50vPFlbJnXICNf1WlSdn5wTHY=;
        b=gqZ2uHdkD+Fcb/ipzdGpr7e2wZHGALSRtVC2u3Mei6owjPAbTw3kYAOefPSHp1PCpg
         UGLSNxHWuWD0mTwgFOaXtil4tP8zBqN9ibsYirMZ1MbVY30GWMjdpCRZULit2UdUBrIK
         TgS+K0uREGuPjrknvhFETuEQnZUdPbu8aX/xHT1cdKdWj6J5+iUrKQx/cSjdtlzu/Va8
         FKTkU5zkyJM4tWKsuVg7Ax7jfT5Fy7PlAILFsNzkTCepIMw3/r4vJoRarBG3t1c4n2JM
         OewDvKKY8DVtEn9Er8zJ39YTtVZeYw74WyrGK0kiG2RwgyOpx/N5ATsz9wQ+lWgKae7U
         NcTw==
X-Gm-Message-State: AOJu0YxpQ8bf5RGriRLQcGwdcw+7gSbDp6rGEUf2Hawf3MnMmbjbcAXt
        xpN3TgY1CZdwW7wIribIF/rxhw==
X-Google-Smtp-Source: AGHT+IEekDnaCyM1jFkUv5e/jr17//76CHNCjve7vjqB/6LansiKHyMlI0JbtqXT4j1Rne7qfOcrKw==
X-Received: by 2002:a2e:b0f9:0:b0:2bd:f8:1b6a with SMTP id h25-20020a2eb0f9000000b002bd00f81b6amr3604555ljl.36.1695997115593;
        Fri, 29 Sep 2023 07:18:35 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k13-20020a05651c060d00b002b9358f5088sm1481286lje.53.2023.09.29.07.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 07:18:35 -0700 (PDT)
Date:   Fri, 29 Sep 2023 17:18:31 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mips@vger.kernel.org, linux-staging@lists.linux.dev,
        Oliver Crumrine <ozlinux@hotmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Subject: Re: next: mips: cavium_octeon_defconfig failed -
 drivers/staging/octeon/ethernet.c:204:37: error: storage size of 'rx_status'
 isn't known
Message-ID: <ccc85f1b-e932-4aa1-81c2-185df391fe82@kadam.mountain>
References: <CA+G9fYvVETLEtiZ=MFRrxgXpmgirVHz-tDOxhU=7_9dtmx7o5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYvVETLEtiZ=MFRrxgXpmgirVHz-tDOxhU=7_9dtmx7o5g@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This is weird.

I managed to reproduce this once but couldn't reproduce it again after
that.  It seems like an intermittent thing to me.

regards,
dan carpenter

