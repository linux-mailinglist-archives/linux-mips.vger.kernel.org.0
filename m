Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72F9E436D2B
	for <lists+linux-mips@lfdr.de>; Thu, 21 Oct 2021 23:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231309AbhJUWAB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 Oct 2021 18:00:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbhJUV76 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 21 Oct 2021 17:59:58 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C20DC061764;
        Thu, 21 Oct 2021 14:57:42 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id e144so2877565iof.3;
        Thu, 21 Oct 2021 14:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FSABqEeJqnZ+jHsFyMQarpYG+7kfHP3vDYD7ydi62K4=;
        b=NXdJQknP22vd1IbihARiP2NGsuaMMJox6H+pm2qDtVHqiFFKhuUC5rAtBlWDposUm5
         rhrGqRvxFRLR4o3uiZfjzkIq2d7t7UwwDw1GZNTu592VQ9/ChonuVp03Kp/i0/SJabam
         hR62AVH5Svo1EM6E9XNzFSlhYnm2kyB3QCGRs633qMbfLhuZ8mLLvZal4R/GE1/v8mKB
         N4vlzerklsRdBxNF8IjbChvfcdkNJZWsAHPWKxOQQZOiTy3QVRnxPIlcP4xHAZ4qjNic
         XlkGXDfbS2QacNcXjP/IUoZ9dd/HqIzPX6mJuiCpJjEqavY6HbG95nTBdhJMl97Od2aN
         YXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FSABqEeJqnZ+jHsFyMQarpYG+7kfHP3vDYD7ydi62K4=;
        b=Bq9fhv+5jr+3CuxxLYJHMxxx4r9fV/9itrNwVBnOFJNwGwRsM+UikQ+0/Yt9z/xgV3
         Yhsmlqo2M+5UETS8IeP1NvhVzIY/l8RoSKksoqIGBrZ1pW9EJNogaTFITj9blB3Og1Rq
         fwokuSp4kop1zYCec3rGYsPzxqPS/JqWpz9Kxso1Nl+H3gudjDm+tyXhCMMGWLesqH04
         6mef2eE3UfPJM5CTiDotLX0wInVgerhS5xmHNhehcZ/UyalpT0C+L08pSQJGaJeQbApk
         tX52TE0k87/pezYPDmLF+4Ccxl7/a2BtDm1bL1lcVHCHbnjicDrSrOLOrqM5PqQLKOGH
         X4ZA==
X-Gm-Message-State: AOAM532yHLU69oAgHy84Mez5kut43FFZT33XLha1GbNmZZM3mUSXD5HU
        FJqfoix4RFjgWdXGRWa8OhSE7vb2dDFDa72BmdhTybl8
X-Google-Smtp-Source: ABdhPJwMzz89zWyFY2+2O3HyK/5QOB5o5Wjo/F1dBspXx9rinoZSz9SFMAKPHnY5g15Sl37ZbOoHntsWTcG49ZVFhW4=
X-Received: by 2002:a6b:8e52:: with SMTP id q79mr5859794iod.64.1634853461875;
 Thu, 21 Oct 2021 14:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20211019144520.3613926-1-geert@linux-m68k.org> <CANiq72=wnrwGbWygt2R_rsyKf3hq6vJUad4NDJwR4FeNFHZ55Q@mail.gmail.com>
In-Reply-To: <CANiq72=wnrwGbWygt2R_rsyKf3hq6vJUad4NDJwR4FeNFHZ55Q@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 21 Oct 2021 23:57:31 +0200
Message-ID: <CANiq72mtsuiKmFFm37fuykrm7rqRTNgGBypiqp-+NUM99qx8GA@mail.gmail.com>
Subject: Re: [PATCH v8 00/21] auxdisplay: ht16k33: Add character display support
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-leds@vger.kernel.org,
        linux-mips@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Oct 19, 2021 at 6:44 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Thanks for all your work on this. Unless somebody is against this, I
> will pick it up.

Applied, thanks!

Cheers,
Miguel
