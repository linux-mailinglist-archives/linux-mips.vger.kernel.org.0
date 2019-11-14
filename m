Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59543FBCC6
	for <lists+linux-mips@lfdr.de>; Thu, 14 Nov 2019 01:00:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726195AbfKNAAN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Nov 2019 19:00:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:44052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726628AbfKNAAN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 13 Nov 2019 19:00:13 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 01505206F0;
        Thu, 14 Nov 2019 00:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573689613;
        bh=SMoH6WwYPt/ixZvrWX0yET7Q++IwXKfiGaXl8elanxg=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=v6azWa7aLlXLxpMwHARRMmnvE9HBxwA8StGNNm56uYbBgTbSRdNUbj08rc7id5EMe
         vgK/P8D++PHM9JUtGuOeLOZiYdc3SJ2s5vufdHshIrxuoGRY223prQn1WxZPCzjZsk
         Q8AsYO8hXW+smxrAEll4s0RCSXXLqIqpZOs6qjZE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573378102-72380-3-git-send-email-zhouyanjie@zoho.com>
References: <1571421006-12771-1-git-send-email-zhouyanjie@zoho.com> <1573378102-72380-1-git-send-email-zhouyanjie@zoho.com> <1573378102-72380-3-git-send-email-zhouyanjie@zoho.com>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, mturquette@baylibre.com,
        paul.burton@mips.com, robh+dt@kernel.org, syq@debian.org,
        mark.rutland@arm.com, paul@crapouillou.net
To:     Zhou Yanjie <zhouyanjie@zoho.com>, linux-mips@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/2 v3] clk: Ingenic: Add CGU driver for X1000.
User-Agent: alot/0.8.1
Date:   Wed, 13 Nov 2019 16:00:11 -0800
Message-Id: <20191114000013.01505206F0@mail.kernel.org>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Zhou Yanjie (2019-11-10 01:28:22)
> Add support for the clocks provided by the CGU in the Ingenic X1000
> SoC, making use of the cgu code to do the heavy lifting.
>=20
> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
> ---

Applied to clk-next

