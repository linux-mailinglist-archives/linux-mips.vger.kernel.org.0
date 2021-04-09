Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC0C635A589
	for <lists+linux-mips@lfdr.de>; Fri,  9 Apr 2021 20:15:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234617AbhDISPn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 9 Apr 2021 14:15:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:35284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234601AbhDISPk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 9 Apr 2021 14:15:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C30736100B;
        Fri,  9 Apr 2021 18:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617992126;
        bh=fQ2JN9dNxhKXdKovF2jMBNkmKRO7y4Cs/zqv1a8yX2I=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hd3UIy8gNPv/EEgiIEnFhsQaQ2m3pwWZH9HvWfRdvJjeCYra6dhr1lmrYgHLzS/TZ
         LhhPS4ssNi2JY7c5N3f3gvqvuA3ZkHPD9VI4rAeMSZ47poj1+oGlKLo6D/wuwSSRt1
         GFFNvUtyk5zlsheEH1x48O3xACUxIpIOwwy57r8GgJmHBDMlNjsUEQKBQsqIyaaKnN
         O9PXD4rzR6+qb+guImpX8fWRHN5bDjGRvWtXWdMOCJTb1OeSIgrCHYkZCL7PTPHLem
         oepQwGLdNyBTtvln+lcObEAyync0Iu9iMPjg/n39+HRI11jNqSDMk4ns3WX1nqg3yA
         pawXa7N0Hkrxg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210309052226.29531-3-sergio.paracuellos@gmail.com>
References: <20210309052226.29531-1-sergio.paracuellos@gmail.com> <20210309052226.29531-3-sergio.paracuellos@gmail.com>
Subject: Re: [PATCH v11 2/6] dt: bindings: add mt7621-sysc device tree binding documentation
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Fri, 09 Apr 2021 11:15:25 -0700
Message-ID: <161799212554.3790633.13295684894366579803@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Sergio Paracuellos (2021-03-08 21:22:22)
> Adds device tree binding documentation for clocks in the
> MT7621 SOC.
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---

Applied to clk-next
