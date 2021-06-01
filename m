Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B2A139732B
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jun 2021 14:26:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232569AbhFAM2T (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Jun 2021 08:28:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:46516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231219AbhFAM2T (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Jun 2021 08:28:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E31906101C;
        Tue,  1 Jun 2021 12:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622550397;
        bh=a38jaUZv04UsqUYPlnPMQ/Li8l55DXCKECZNZOc94fw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LjWBiIfkvmWmsQzrfJN8zYBi345N11hLR9HtjejP6uJZOrIuE8H0QMpEVcNhi2utV
         hwhspjvsqRBkH/SFSDqaRf4t5+K9HpwmSCeZufZpkPKxgUtAPiGN8lqIZ9Yao2q75j
         O2WsP2ljNmU+hPhxyGOpW8kgFDs3rnf13715AbJo3WWfCNYSOfnVLrU2j3IiVdl8QB
         ph91tSBRMwgHqvJZxZLuh9Ytp+m1xsBE1Tqr7+aRsNTAXRDEjm8vIQpVK69kLHGgpb
         CagBQT1NPGdamHH8pu618DFrgvauUu3Bgz7IYrPpSFWK61ARN5dq4c58M++OmTXsC3
         Y1Az9oq2CYgXw==
Received: by mail-wr1-f50.google.com with SMTP id n2so14172567wrm.0;
        Tue, 01 Jun 2021 05:26:37 -0700 (PDT)
X-Gm-Message-State: AOAM530Js3Ghaz/dQJLfXwtbUqRjT7yuLniB5+RNl3duJSOlOwCu24h2
        Z1FmA34F3NnDrJyUHBOvVGLlcOxYjC53tKz3YLg=
X-Google-Smtp-Source: ABdhPJxUF1UZrgYDVHmwlggViBcMhY2+tVOR2r0G7VYUFDmeKMwNXeZTfixMnB96lpP9cP/oCVl8Sgxa7j2VZxic/lE=
X-Received: by 2002:adf:a28c:: with SMTP id s12mr28983779wra.105.1622550396551;
 Tue, 01 Jun 2021 05:26:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210531184749.2475868-1-arnd@kernel.org> <20210601095129.GF6961@alpha.franken.de>
In-Reply-To: <20210601095129.GF6961@alpha.franken.de>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 1 Jun 2021 14:24:59 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2Ueg0UFZisrzrrL_MkBLnu6TbMtVGx4_wO0d6rj48weg@mail.gmail.com>
Message-ID: <CAK8P3a2Ueg0UFZisrzrrL_MkBLnu6TbMtVGx4_wO0d6rj48weg@mail.gmail.com>
Subject: Re: [PATCH 0/7] clk: clean up legacy clock interfaces
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Florian Fainelli <florian@openwrt.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        John Crispin <john@phrozen.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jun 1, 2021 at 11:51 AM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Mon, May 31, 2021 at 08:47:42PM +0200, Arnd Bergmann wrote:
> > As I noticed that the ar7 clock implementation and the ralink version
> > are rather trivial, I ended up converting those to use the common-clk
> > interfaces as well, though this is unrelated to the other changes.
>
> excellent, how is your plan for merging the series ?

I have not decided yet. I think it would be best to keep the series together
and merge it through the clk maintainer tree, or possibly my asm-generic
tree, but as there is no rush, we could also do the mips and m68k bits
through the architecture trees, and defer the rest for 5.15.

       Arnd
