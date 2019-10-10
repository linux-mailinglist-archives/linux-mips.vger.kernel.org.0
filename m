Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7399D2D0F
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2019 16:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725909AbfJJO64 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Oct 2019 10:58:56 -0400
Received: from mail-yw1-f65.google.com ([209.85.161.65]:44143 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbfJJO64 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 10 Oct 2019 10:58:56 -0400
Received: by mail-yw1-f65.google.com with SMTP id m13so2257267ywa.11;
        Thu, 10 Oct 2019 07:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8UJVAVd9tVKum+aEXONwvAGLsYA36w9rZPqLYuWLasE=;
        b=sOEsd8Kwch2+znDIjN/oXghsz7hbqTlimJTJT00inkT3BZcYds/bSHA7JnIci03J5D
         G1ZLuF3ShSaWGr842VYsb5DqUMDybXxEUrmYD7LlN5SpEaMNF3CwbnBYK1hpejmN5nql
         13qeLprE+hdOJgr4mWRxbiJ+4AgZlfYrsoXyarqeSDbkHPd2xGgA6K+a/4WJiZXOu2jO
         7oY3kX+VwavRMg7IfBbx8Gdr2gy5xQXfHHCgSufekZKymGLhFVNTaxPaQPDrCTRX2YwW
         rvcV6sJAV0wTiT28fjfc0QVRvw/rJYrN7mHvQZh0ZSz+AllOofD0QlxEuFPtFwjTDlAL
         hBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8UJVAVd9tVKum+aEXONwvAGLsYA36w9rZPqLYuWLasE=;
        b=CsH4snkamSVBS7LVg2F0g7Neer1yWPeOScxbIBe+3e+3cu5OYGbmeIaotnO1jDS9aH
         GiGGZm/cRxIYc+yMLB87h90mxV/ZzcQEDoBbN94n0hqliPBcVj7tYK3mogFRnQqbkH2U
         7QhVAvSeeDJ8om7oNlWIyiq42aCriTXBWBiwM7RNs4Frrs50WLqmE6PK9Yzk+q3CR2XV
         GF2arlAmLCtfaFro54CfqCm7QcQi+E1OWHRIr0x6BqYqAdaIc5XI+pm7oH8YAI6zE0kH
         +vCckzscFrPEySSXSP7lcwORAiPQUcVLXZCRLznhzCwGCtN1huquxxilOXTCeLPBVudc
         xXfQ==
X-Gm-Message-State: APjAAAVdbBfs17dfjA35dmj6nR2mshjPCKQ3GfEyzWoFuROz6+0BjmrX
        p9TdHaepjtiT4zqMCkq5fnKyNJUwzl4FUGcGuu60/rnZ
X-Google-Smtp-Source: APXvYqzwdaF2b4NMce+fPnJQEiHyr1tsRlXvr37+bAPGZRjkX6sxjct6psuDgAamkwGelEt5kah/yQ3WttZohu6a8gk=
X-Received: by 2002:a81:80c1:: with SMTP id q184mr7995099ywf.128.1570719535254;
 Thu, 10 Oct 2019 07:58:55 -0700 (PDT)
MIME-Version: 1.0
References: <20191009155928.3047-1-tbogendoerfer@suse.de> <20191009184311.GA20261@infradead.org>
 <20191010150136.a30e47b37f8c8aed9e863a5e@suse.de> <20191010135308.GA2052@infradead.org>
 <20191010164850.34a8d2274720e1bc26fd34d8@suse.de>
In-Reply-To: <20191010164850.34a8d2274720e1bc26fd34d8@suse.de>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Thu, 10 Oct 2019 16:58:45 +0200
Message-ID: <CA+QBN9B6q3piiB+d1=+-5L5op-RYto2vKKEDUTQ=ShTd13RQaA@mail.gmail.com>
Subject: Re: [PATCH] MIPS: add support for SGI Octane (IP30)
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

with my friends, I opened a forum here (1), where we are randomly
reporting progress and problems.
we fixed the machine_powerdown() function.

ugly patch, anyway the ip30 can poweroff




(1) http://www.downthebunker.com/reloaded/space/viewforum.php?f=3D69

Il giorno gio 10 ott 2019 alle ore 16:49 Thomas Bogendoerfer
<tbogendoerfer@suse.de> ha scritto:
>
> On Thu, 10 Oct 2019 06:53:08 -0700
> Christoph Hellwig <hch@infradead.org> wrote:
>
> > On Thu, Oct 10, 2019 at 03:01:36PM +0200, Thomas Bogendoerfer wrote:
> > > ok, as far as I can anticipate IP35 verion of this functions will be
> > > the same as well. So I'll move both into pci-xtalk-bridge.c in the
> > > next version of the patch.
> >
> > Sounds good.  In fact you probably want to send a prep patch just
> > moving pci-ip27.c to pci-xtalk-bridge.c and adding a new
> > CONFIG_MIPS_PCI_XTALK_BRIDGE option that all these ports can select.
>
> the option is already there and used by IP27.
>
> Thomas.
>
> --
> SUSE Software Solutions Germany GmbH
> HRB 247165 (AG M=C3=BCnchen)
> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
