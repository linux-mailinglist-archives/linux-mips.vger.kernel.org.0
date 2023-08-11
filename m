Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52691778E9A
	for <lists+linux-mips@lfdr.de>; Fri, 11 Aug 2023 14:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235214AbjHKMCk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Aug 2023 08:02:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229683AbjHKMCh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 11 Aug 2023 08:02:37 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48AAB10F
        for <linux-mips@vger.kernel.org>; Fri, 11 Aug 2023 05:02:35 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-d6265142e21so1757591276.2
        for <linux-mips@vger.kernel.org>; Fri, 11 Aug 2023 05:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691755354; x=1692360154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CXtgREuhmv47Kw+ao1teWaVgLC9bV06E2de0JQaJVM=;
        b=oNTkC6acME+G8I0ioLywq/8DK095y6KyDHOJnLXIypQYGQn0xuoJCqexNEZqANfLNc
         A8DKfeV3zNVlvOSzO3nmjZTvaULEKrrInwod/wC5VAZqljMXg7nRhdya/ZbEyt10WEHn
         i6UCiWPm18c0MteNkKvCYZ9Rxb4h6oevJ2GwatAPF0lOU26TY4I1XfZQnZer2iRF5+B4
         nuGYcC59Pyf4aZFBh0isMayaSpV1+QjqVbEjMevnTuQC7Ukf8wS3AQLMtU5ISE32xs0i
         RomEhXEWtqTDbg/11TUT9X6DOC8/qwX792IRPqJrVVSgGzRFtneo+GJKSe9VmldEx4up
         qqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691755354; x=1692360154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CXtgREuhmv47Kw+ao1teWaVgLC9bV06E2de0JQaJVM=;
        b=YUKUOvaxvysNbRg7Hlaujj2Dz3zFcsYG3KHEo9akTv8NJeNysoXeG1P9rMd1MWx3MS
         P/yxXlcTEnZWn4u0SXbO2KQm/QoNQhGV2K5jPJ6sMHLn8zjQM+qBqegnTujrRMjT4mTU
         9ce0GZFOXTaGDPnB5o837YVKpqQeHvKUfIc8/0K2x6rYUAMxPcZur33hbTBSlLzNW47n
         fSosy8R3294RVdtOL0sNpxlDWzjF0fUqVtLNMgKgmfe7kN9gYSknMSlIgUEFcFJf+Wz9
         XgPxs31ZyQsFrLYh3PxKdsPgkXpftrave+fXgSNCYpjK4i6BY56Jh2cfuMladAx/yBIK
         +FXQ==
X-Gm-Message-State: AOJu0YwpvRAOYkWPISeDWBY8FHzrlR4Ihe1BorvfXf41gl0QbqR2O123
        G280iwQYVDs/u5uoc2YMeh9bITBgu9c/IE8DR/dW/Q==
X-Google-Smtp-Source: AGHT+IEqTwqYi3XFQ1XoWt+t7thSmBfY9KEZINHvtEM8V7Uyw58kziNcqtz3Ej4DxqBxltNJ8g3nehmow9akYKkMZBE=
X-Received: by 2002:a25:e7c7:0:b0:d11:ea26:3263 with SMTP id
 e190-20020a25e7c7000000b00d11ea263263mr1447177ybh.5.1691755354460; Fri, 11
 Aug 2023 05:02:34 -0700 (PDT)
MIME-Version: 1.0
References: <ZM+IlctTTQLs7Qg9@lenoch> <CACRpkdZmd-nb21Cx-jp-CDRjW4VQRV=c4MekHxS3h2p3HsDwZQ@mail.gmail.com>
 <ZNYd/mNGROq22MPH@lenoch>
In-Reply-To: <ZNYd/mNGROq22MPH@lenoch>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 11 Aug 2023 14:02:21 +0200
Message-ID: <CACRpkdb+VQYB916TWJCrTabNMkqUReso=hC2eOiK8qxfiEXb6w@mail.gmail.com>
Subject: Re: (Octeon) MMC performance degradation due to too many requests
To:     Ladislav Michl <oss-lists@triops.cz>
Cc:     Robert Richter <rric@kernel.org>, linux-mmc@vger.kernel.org,
        linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Aug 11, 2023 at 1:39=E2=80=AFPM Ladislav Michl <oss-lists@triops.cz=
> wrote:

> Just for the reference, implementation based on your above mentioned patc=
h
> which restores 4.9 vendor kernel performance can be found below.

Hey looks good :)

> It still needs some love, generalization and so on, but as I have already
> started work on fixing Octeon's USB and ethernet, this is far beyond my
> time limit.
>
> I hope to return to this in the near future and convert it into proper
> patch series.

OK on the back burner, such happens.

> Btw, we really need to invent some other name than 'bounce buffer'...

I think it should be called "contiguous buffer" because that is what
it is.

Yours,
Linus Walleij
