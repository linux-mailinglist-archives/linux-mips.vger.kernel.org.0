Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C87A26D248
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jul 2019 18:47:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbfGRQqr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 18 Jul 2019 12:46:47 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:46181 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727708AbfGRQqn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 18 Jul 2019 12:46:43 -0400
Received: by mail-io1-f66.google.com with SMTP id i10so52421691iol.13
        for <linux-mips@vger.kernel.org>; Thu, 18 Jul 2019 09:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TAlbIyymfZNkl7yksWgw8jwEXv/YyuJyJF2ZpI8avBU=;
        b=Hj8MOVIwPyg22FhAteR+5dRP/oScFNTLPZy1R2S/xXmwnrdZ6TxhAupl4hJ8ok3SQP
         Hp69WIQCQJvmQhYNcOOPU6qhx3niPsn/b39WGnYH1ZVQPLSZ9w4pblbASu/GRiQukXQl
         kALkkQRGSPOds0ZYFrFBVBgy5N5Iwt2CNoG4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TAlbIyymfZNkl7yksWgw8jwEXv/YyuJyJF2ZpI8avBU=;
        b=RqrBSmjoZIavb20vJd0RTVbeoqbWdtts4PvAv+kEgun0UA1Zdw+7rtIz4jS2pSrFyq
         +6G851S1Regx8S1C1ln8g5uY4jH4efTJJbZtQlp/ZanM/PTRnHLjh+vHb1GjIy4oNeuY
         euvpZD9YOdvD1KkVHYTm9gDMB5RuSDK5IEvi42lUIn1ej/dxDk0XKYWCWu4OEsMwNEbG
         FsRF8qrmlLNjExSB4utiB3yCFD07TIP40YqYzjeOqaQsRr8w9RH9vhzKAukxge8wUDFU
         F3mxYMoglls62m3XZyxnEsvn2Pqv6F/ADwDEvPiXG3HVSMK8oTL6V4DoGxqH2dEy1DCO
         6U5Q==
X-Gm-Message-State: APjAAAVKeQLW+a0rzLcpjokobKvxf7Tw8mfil/JAEl1k1xAnw2eKvR2w
        Gis1KGP1/vLxjDjzvV3peBJ/PXvRWrKH967eD/aUnw==
X-Google-Smtp-Source: APXvYqzpdpm3KGVnLha0U6+iptqQCL3xOtOk973C+aeEje1Ffp7OXF7uXrq2rxIDU4BAZkkWwvrgSCYz35dXS7s0SmQ=
X-Received: by 2002:a02:cd82:: with SMTP id l2mr48974411jap.96.1563468403006;
 Thu, 18 Jul 2019 09:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190717191926.GA4571@localhost.localdomain>
In-Reply-To: <20190717191926.GA4571@localhost.localdomain>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 18 Jul 2019 09:46:32 -0700
Message-ID: <CAADWXX8VMDJao2mH2hk2omhLGzpTMRJCAtRRavFbykMaLRfLhA@mail.gmail.com>
Subject: Re: [PATCHv3] MIPS: JZ4780: DTS: Add I2C nodes
To:     Alexandre GRIVEAUX <agriveaux@deutnet.info>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        linux-mips <linux-mips@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Your patches lack a sign-off, but the reason I am emailing is that
they get marked as spam when going through the mailing list because
the DKIM is bad.

The email does have what appears to be a find DKIM signature, but it
adds _way_ too many headers to the list to be checked, including the
"Sender" line, but also things like "List-Id" etc.

Which is completely wrong usage of DKIM when you go through a mailing
list (which is _supposed_ to change the Sender field!).

It looks like somebody mis-understood what DKIM is about, and added
all the lines they could find to the list of DKIM-protected headers.

You should generally protect the minimal core required set of headers:
From/To/Date/Subject/Message-ID etc. Not the headers that are
intentionally going to be rewritten by any list you might want to post
to.

               Linus "hate spam, try to fix dkim" Torvalds

On Wed, Jul 17, 2019 at 12:20 PM Alexandre GRIVEAUX
<agriveaux@deutnet.info> wrote:
>
> Add the devicetree nodes for the I2C core of the JZ4780 SoC, disabled
> by default.
..
