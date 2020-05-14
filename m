Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DB531D3E29
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 21:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728858AbgENT5q (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 15:57:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:48972 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727117AbgENT5p (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 14 May 2020 15:57:45 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4157E2065C;
        Thu, 14 May 2020 19:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589486265;
        bh=CobDEcsnK28Wg/deTE3E0V6egb9tUvENMn5Ab3rRyrY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=yF+8UvQxhMZFRf7YXLum4x8OUjj9OWV6Z7yavmEaf57DFTGro7sA6blykspH9iKpY
         q5itK/6TDi6Yfb54HYIHZXU0S4/Uuo0CF6/VKaQlH1xlOBOsCGuCeogOEZ5t3rjADA
         lapB+IyxCat1hOFItfhxHiKpXUW8O2+2K+f3j5lI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200409064416.83340-10-sboyd@kernel.org>
References: <20200409064416.83340-1-sboyd@kernel.org> <20200409064416.83340-10-sboyd@kernel.org>
Subject: Re: [PATCH v2 09/10] MIPS: Loongson64: Drop asm/clock.h include
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        linux-mips@vger.kernel.org, chenhc@lemote.com
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Date:   Thu, 14 May 2020 12:57:44 -0700
Message-ID: <158948626461.215346.9909793666449593660@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Stephen Boyd (2020-04-08 23:44:15)
> This include isn't used by this file, so just remove it.
>=20
> Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: <linux-mips@vger.kernel.org>
> Cc: <chenhc@lemote.com>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---

Applied to clk-next
