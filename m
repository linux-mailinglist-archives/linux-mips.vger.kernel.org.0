Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7886235E6E5
	for <lists+linux-mips@lfdr.de>; Tue, 13 Apr 2021 21:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348048AbhDMTGD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Apr 2021 15:06:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:32776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348043AbhDMTGB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 13 Apr 2021 15:06:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EFCAC613CB;
        Tue, 13 Apr 2021 19:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618340741;
        bh=X7WLKy9e8wfmoHzGrC2MOXVR2/sY8zX4FAt9ZkKJsnQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=jvZhSI5inFIwJG/ctop1+Qq1bAVu1THj4ALBTd+NL1CsVO4gtocGLpUtspwVFWK0H
         COGjJYEdZC17keVMauKk13UtYqQm4UArcGOvrg9G5ZIYoVkCpf/8HvmTxyBIHXP9F7
         jOnyIP09ym3nn2YuvjfQ9YM68bR15qcUwNuyNTrVlrBp+gOfC+FpMMnboTpagCQlcc
         KH2faT1+kK86LRziMe+LDM8m0yKfJvTxOItOWNNgnzZogPFe3eJQ7jhyX0G79vC8A5
         qGwzu1LZtzQBGgQcAckKL15Aa8gDpcsRpxsxZWXZCZYSPfiQ8wtp//CcV5kQaf3ZK8
         5undbdMh+mAxg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210410055059.13518-5-sergio.paracuellos@gmail.com>
References: <20210410055059.13518-1-sergio.paracuellos@gmail.com> <20210410055059.13518-5-sergio.paracuellos@gmail.com>
Subject: Re: [PATCH v13 4/4] MAINTAINERS: add MT7621 CLOCK maintainer
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name,
        linux-kernel@vger.kernel.org
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Tue, 13 Apr 2021 12:05:39 -0700
Message-ID: <161834073962.3764895.16827477929314261830@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Sergio Paracuellos (2021-04-09 22:50:59)
> Adding myself as maintainer for mt7621 clock driver.
>=20
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---

Applied to clk-next
