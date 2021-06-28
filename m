Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33B333B5769
	for <lists+linux-mips@lfdr.de>; Mon, 28 Jun 2021 04:52:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231881AbhF1Cy2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 27 Jun 2021 22:54:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:58080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231815AbhF1Cy2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 27 Jun 2021 22:54:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5035861A0F;
        Mon, 28 Jun 2021 02:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624848723;
        bh=E+2V9utvs5Ba0fzuB83QXOxVyiDDhOqR9Phmh/bBUOI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=nKnfn+hf71jMePfWORqgSKk1YJlY4Drswbiayp0M4FRoLCoOELiZ3jy72GT84a74X
         bxv+ww6Tq6uBSeqr3qBQRpydPLdR/4M/BElxKeSGri8VMxG7xxgyV4N9BHPUrg0597
         Tzjedk6cKKXPmH5fKb07ag+yvberRnaFLVlvg8H2o30YKiKov3qfKVU7/PJeTDcjn5
         3v8KLZjtlD4Y0UGEbxLf4MQA8Usa0U756KQENhsM1F9qz2+KPmFAO4H3ZHeu4vkzVa
         cWHNnBHTFap/ZAegrtr+1NACAfpuJnYWrVmpAtXX8yI4qjXer2JRCUlzMLyUWo2+Dt
         IHBdsuo3qlaqA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1624688321-69131-3-git-send-email-zhouyanjie@wanyeetech.com>
References: <1624688321-69131-1-git-send-email-zhouyanjie@wanyeetech.com> <1624688321-69131-3-git-send-email-zhouyanjie@wanyeetech.com>
Subject: Re: [PATCH v4 2/5] dt-bindings: clock: Add documentation for MAC PHY control bindings.
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com
To:     mturquette@baylibre.com, paul@crapouillou.net, robh+dt@kernel.org,
        tsbogend@alpha.franken.de,
        =?utf-8?b?5ZGo55Cw5p2w?= (Zhou Yanjie) 
        <zhouyanjie@wanyeetech.com>
Date:   Sun, 27 Jun 2021 19:52:02 -0700
Message-ID: <162484872210.2516444.13185593951785977784@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) (2021-06-25 23:18:38)
> Update the CGU binding documentation, add mac-phy-ctrl as a
> pattern property.
>=20
> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wany=
eetech.com>
> Acked-by: Paul Cercueil <paul@crapouillou.net>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

Would also be good to add it to the example.
