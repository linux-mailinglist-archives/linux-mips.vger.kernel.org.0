Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C36C113DAA8
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2020 13:54:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbgAPMxX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jan 2020 07:53:23 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44012 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbgAPMxX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 16 Jan 2020 07:53:23 -0500
Received: by mail-ot1-f65.google.com with SMTP id p8so19196865oth.10;
        Thu, 16 Jan 2020 04:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UTrPLVNO7VWMNeu8igv+LQcUt1WzUrjPtjLMSVo2xbk=;
        b=lZv9Axne9P671ULx5Jo7hSSDdO0Mp7UYRSOOE0bv5PjDolvDoS/0ZgjIp5uUBktcDz
         tqJxfCOKKbWhqaALp0YMUnc0yQ3Flda0267nae3Hj/IDqnhiRTMdK7Wkt0XPifn0ldyM
         L1LLVFxzhmo7y29E/8C0YQ/VkFB6EAEU7Ow2co4r7k8RlTWm3XWHnhdLjg1ELviKP/p9
         /WvivKjb835Pj3U0Rqo53wLNKlyKYdelipVDY5RkYBN3Bqsm+5MgENVUEe5uvFz8gTlT
         XFlHbJwQzDzx7WFkW0iEPlgCQxzwCFNW/KcutszMyQNpYxlmNGzj6u0PcXj7BNMG68q1
         Ab1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UTrPLVNO7VWMNeu8igv+LQcUt1WzUrjPtjLMSVo2xbk=;
        b=k+5UaN36EWq8MFmmVc8KoEkv7DXeURjt/8WD9K5N0kEl8MiF0TRCW/CeClOAjAFbSC
         7hMmTWZo6p7D4ewKzzozZHDg1xobsQpyhYoINy0o8kWV72jPR/gtnnmRQlNOjZcdsUbC
         YbP0jiZ6wbJj2g1dhmuQbK8wnl8BYMlgXueZ7RSdZ/qJetazCMiZQGTEXa/E9y+Ooe2K
         4qZv1/06nt+iXf7LbaR9DOjP85wO53++kRFli57kfKwVQ9ib2jcHGUp2MEHvil7falmS
         BAwAyJ2YDSH+77XQ3sEk9WfJkb9yhDOIjakEOQrP/XtcRxt3UNV6liXo+1O+21UZSjOT
         R9pg==
X-Gm-Message-State: APjAAAUxtHMRoO7YxBjHj8LaP55XFDSvpEcwxUwCwJFpmlrjVV3vyY9P
        5BWB47SW6LNrJ7bkDzU45f+cIUw+8hP5GhK7NFkuh2iP
X-Google-Smtp-Source: APXvYqzo6JOoRDSNx8gmB+ryX9A2AF6TP/amBNBj/nmQkkGhOvhtKfPdee3vLa8hlhn9EtBrlD236NHOQpuXsmjXki4=
X-Received: by 2002:a9d:3bc4:: with SMTP id k62mr1878121otc.186.1579179202433;
 Thu, 16 Jan 2020 04:53:22 -0800 (PST)
MIME-Version: 1.0
References: <CGME20200116122951eucas1p1d36493f2b496bb13dca4fd1a17abad49@eucas1p1.samsung.com>
 <20200116122938.20789-1-b.zolnierkie@samsung.com>
In-Reply-To: <20200116122938.20789-1-b.zolnierkie@samsung.com>
From:   Manuel Lauss <manuel.lauss@gmail.com>
Date:   Thu, 16 Jan 2020 13:52:46 +0100
Message-ID: <CAOLZvyH-gP36fjC3EpkLLAi0Ha0sXvgmMqgQ9CnZ3-rHNTdU9A@mail.gmail.com>
Subject: Re: [PATCH 0/3] ide/MIPS/docs: remove no longer used au1xxx-ide driver
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     "David S . Miller" <davem@davemloft.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux-IDE <linux-ide@vger.kernel.org>,
        Linux-MIPS <linux-mips@vger.kernel.org>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jan 16, 2020 at 1:30 PM Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:
> Commit 54ff4a1d1732 ("MIPS: Alchemy: pata_platform for DB1200")
> from year 2014 converted the only user of au1xxx-ide IDE host
> driver (MIPS Alchemy DB1200 platform) to use pata_platform libata
> host driver instead. This patch series removes dead au1xxx-ide
> driver code & co.

For the whole series:
Acked-By: Manuel Lauss <manuel.lauss@gmail.com>

Good riddance. This driver really only worked well with the db1200
board set to a specific
cpu clock speed.

Best regards,
      Manuel
