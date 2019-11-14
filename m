Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBEADFBCC2
	for <lists+linux-mips@lfdr.de>; Thu, 14 Nov 2019 01:00:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726949AbfKNAAH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Nov 2019 19:00:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:43930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726628AbfKNAAH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 13 Nov 2019 19:00:07 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4DD0D206F0;
        Thu, 14 Nov 2019 00:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573689607;
        bh=Y6Eieh9beInLEW7jW9lSW9b/ygUtDFn49k3uQk4DJL4=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=I4pMUDX6RuRIZY9d5h/7PHKkS9Z4/N9AQMXFgY7C2B0zXUqMem3cSuhBT6KHGkms9
         jy7l8oAw42vPiMJLQ0Xz2TyVe/F3vChqS9sGfEwVr+EFCfPkEovPO+nncURMRB+Vj9
         XTG6OWp6oQHFVizbwCpL77mYvZ1j1iQxHN8bRJ/M=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573378102-72380-2-git-send-email-zhouyanjie@zoho.com>
References: <1571421006-12771-1-git-send-email-zhouyanjie@zoho.com> <1573378102-72380-1-git-send-email-zhouyanjie@zoho.com> <1573378102-72380-2-git-send-email-zhouyanjie@zoho.com>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, mturquette@baylibre.com,
        paul.burton@mips.com, robh+dt@kernel.org, syq@debian.org,
        mark.rutland@arm.com, paul@crapouillou.net
To:     Zhou Yanjie <zhouyanjie@zoho.com>, linux-mips@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/2 v3] dt-bindings: clock: Add X1000 bindings.
User-Agent: alot/0.8.1
Date:   Wed, 13 Nov 2019 16:00:06 -0800
Message-Id: <20191114000007.4DD0D206F0@mail.kernel.org>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Zhou Yanjie (2019-11-10 01:28:21)
> Add the clock bindings for the X1000 Soc from Ingenic.
>=20
> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
> ---

Applied to clk-next

