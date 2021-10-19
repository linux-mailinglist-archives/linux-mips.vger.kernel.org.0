Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3247643402C
	for <lists+linux-mips@lfdr.de>; Tue, 19 Oct 2021 23:09:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235088AbhJSVLs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Oct 2021 17:11:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235091AbhJSVLo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Oct 2021 17:11:44 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02B2CC06161C;
        Tue, 19 Oct 2021 14:09:31 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id r134so22017263iod.11;
        Tue, 19 Oct 2021 14:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gSgmLlZesXp0UPK7EJc5fRtKiiMGTySocpMsl7A7n7Q=;
        b=HAxMmitDGLKWbQjqS4FDAiW85pmatSMd5L7L4Pxet8v2HGIRLnugWRFX+RSqlbqn7H
         2uoF/TwW75mJx2Ae/QRIoL4BYEMDEBVQDYqNAdmknQgJi1hNyWHYm9UK1Fb9AsNGVGJv
         8KrXCFHrnW1nbcNzfrDdUpjrt0TBfQa2iMKD1mH8mGWP6c4gMLPCEYdf2znJRsHgF4dv
         yLCa/Po410JXUpQqzRP9RPv9yXTLVonh/T/K3HNioxV1Ctt2VZ+oBIF40Bym5+YeJ+Zv
         76iow0Ntqigt/k88WXjV8mpFuLjuMbVfzDS1aRtwkHro7/WMP9xWYbj/lMrDcBtGbKJw
         oLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gSgmLlZesXp0UPK7EJc5fRtKiiMGTySocpMsl7A7n7Q=;
        b=3DEysfJHKijYhY8B9Tfk3UOCMU8e56G5AS9H539cVpAbkUeeXcU/q1WPN1YqTpxWNF
         du6vvGNuF4DWWobJyjnvlXIgd0S+cTdK9D6Y86t3f2FwstDF7e8kmotiLSXn4bq2r9J2
         9wCnICnAfMrgusma4DN4PsBZqcBk9fXtwYdk/ktUpHjGhxuGdWAFsd/Muhx/rz6zGBIs
         XpquTtXdbHdufTT1ieEKZOuWU7IpidWQxgYgpsZk/plo5LBwpHDHpjDeT4kT4XivsgTr
         aTo3SHW1PqsILpuqf1hZog/THpyhaEzyEyT1gUQJWYdVjgw3wpK+nElloKQ9pLMswUfi
         bB7g==
X-Gm-Message-State: AOAM532s10G33o/G0K/jLgBeU/PR2ihdgsFbV7IxdSR2H1g7SLmHpHUI
        Q//F03+dO3N7DWS/rzwbmWlZJLD9u6b+IYiVj/4=
X-Google-Smtp-Source: ABdhPJz+PExeukRcxH0tc75AJjRxjzJphT/Ebaz3zbzs5+L8nbOuox/h1IspP25GGXhXdlINfWQE9L4CatIp5Cyet78=
X-Received: by 2002:a05:6638:1924:: with SMTP id p36mr5920361jal.142.1634677770420;
 Tue, 19 Oct 2021 14:09:30 -0700 (PDT)
MIME-Version: 1.0
References: <20211019144520.3613926-1-geert@linux-m68k.org>
 <20211019144520.3613926-4-geert@linux-m68k.org> <CANiq72nJS_rxwB7BQJ30iEeFcX8_7VznkF0DvueM_Ym+Wqd94A@mail.gmail.com>
In-Reply-To: <CANiq72nJS_rxwB7BQJ30iEeFcX8_7VznkF0DvueM_Ym+Wqd94A@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 19 Oct 2021 23:09:19 +0200
Message-ID: <CANiq72nGPzDEeiQccTQ6QCeionfkfp01EDjp4btBfYKabXzGrg@mail.gmail.com>
Subject: Re: [PATCH v8 03/21] auxdisplay: img-ascii-lcd: Fix lock-up when
 displaying empty string
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

On Tue, Oct 19, 2021 at 10:50 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Unrelated to this patch (and no need to change it), but we could
> remove the conditional guarding the devm_kfree below to match this
> one.

Yeah, you did it when moving the code later on -- I guess we could
have done it before too, to match, like the sysfs_emit change does it
before, but it is not that important.

Cheers,
Miguel
