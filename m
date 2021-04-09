Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4212435A586
	for <lists+linux-mips@lfdr.de>; Fri,  9 Apr 2021 20:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234416AbhDISPe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 9 Apr 2021 14:15:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:35130 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234307AbhDISPe (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 9 Apr 2021 14:15:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D80366115B;
        Fri,  9 Apr 2021 18:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617992120;
        bh=+ujI/MPJ6ZQ5E1B/DUb1I7zwyG59eiq8HKHFW2iT6ag=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=LZwVmvxRUJoPiLq0E0naPKbbH0plygrBLxnPh6uNLTje75q2/Pk5tEZrPNcrkMJFX
         2T7mmAQ5sAayVQEqUec/L+uHNEElOAj0CjJVWyG3dtpg6Vb/GsdmQjZrHLcKnWzFVD
         bnxn0ALWkTAg+/i/wP4bA2lsWTvFVkr3BvFpkQkhyPjLe+GLrCqIEahQKbOyGxG2UJ
         OYZvhSQ0s2XOtetIeWiZiBb8jsYAabHX+OiKlqEb1tD4R5KZRewLFpzLq3+eAJbnGR
         yE242O2bZq/KqvdtU0zDNK3l3ufr4cHRRi39duYvQ1SUQ6VAocYDVavi0jBYEqTUgu
         vf2weMvs8yfgA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210309052226.29531-2-sergio.paracuellos@gmail.com>
References: <20210309052226.29531-1-sergio.paracuellos@gmail.com> <20210309052226.29531-2-sergio.paracuellos@gmail.com>
Subject: Re: [PATCH v11 1/6] dt-bindings: clock: add dt binding header for mt7621 clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Fri, 09 Apr 2021 11:15:19 -0700
Message-ID: <161799211963.3790633.17291129306926041019@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Sergio Paracuellos (2021-03-08 21:22:21)
> Adds dt binding header for 'mediatek,mt7621-clk' clocks.
>=20
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---

Applied to clk-next
