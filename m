Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE6D53B5760
	for <lists+linux-mips@lfdr.de>; Mon, 28 Jun 2021 04:50:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232056AbhF1CwY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 27 Jun 2021 22:52:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:57748 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232055AbhF1CwY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 27 Jun 2021 22:52:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36F5D61A0F;
        Mon, 28 Jun 2021 02:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624848599;
        bh=NowBt/iUK4xeRJvIjtzTbj6yn3oSZTD+VTMlJQETF88=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=REGMzDEOxwtqKW3YHOjfU5zN41zRw6RFTSi6gahLBCIXsmU8+4mzZK83xPviK7i4v
         GfR/fjTRdrMYgNtDCcCFqDGn6XW4ToSg4UCoM4AFiudQl2qxC/5CmzLTMNeJe9tHag
         oLvdyv0dW2XXjBFeaME8ojqo/9MxQXLXdhDvI91gVPEFSBzsPOGShiB2zd7gWGtHvC
         MC8+gC0jH+vfyQ41vlsJTlckae0kCNIscjZJqBt0hDO5A3dIDrh4PdQWTufW8eIPP/
         KF+aqMPU3kk0yGgl+1matDbiPgyrcuBPSRhd5l6b9RhsUiq3IqO1ulCFAkzXb3UM31
         aW/8wHq+YjiPA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210530164923.18134-6-paul@crapouillou.net>
References: <20210530164923.18134-1-paul@crapouillou.net> <20210530164923.18134-6-paul@crapouillou.net>
Subject: Re: [PATCH v2 5/6] clk: ingenic: Support overriding PLLs M/N/OD calc algorithm
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        list@opendingux.net,
        =?utf-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        Paul Cercueil <paul@crapouillou.net>
To:     Michael Turquette <mturquette@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>
Date:   Sun, 27 Jun 2021 19:49:58 -0700
Message-ID: <162484859814.2516444.679689134163071534@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Paul Cercueil (2021-05-30 09:49:22)
> SoC-specific code can now provide a callback if they need to compute the
> M/N/OD values in a specific way.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie)<zhouyanjie@wanyeetec=
h.com>   # on CU1000-neo/X1000E
> ---

Applied to clk-next
