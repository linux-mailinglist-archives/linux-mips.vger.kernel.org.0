Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F2DD58BB4
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2019 22:37:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbfF0Ug7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 Jun 2019 16:36:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:52892 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726443AbfF0Ug7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 27 Jun 2019 16:36:59 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 500AA20665;
        Thu, 27 Jun 2019 20:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561667818;
        bh=DsMcplyTEYbBH+8y3/XcIMhaj5Scb/Qv8vILe8IiSJY=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=j2eE+I4k9fgYdiKSQtkgYwJRaOXQXgmTfpjeq/g4aRWbt02rLc4UpBAiuiaAHLa3B
         LIY/nTVskn2Mx2igCUzyNquk4KjZ1jMYcrUNoXaR7c/uQfr9WMTipnEFOT1wg+jefe
         y8/OTa/5lcbkci3W23neAD8raUZVeGFWZhpUx510=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190502122657.15577-2-jonas.gorski@gmail.com>
References: <20190502122657.15577-1-jonas.gorski@gmail.com> <20190502122657.15577-2-jonas.gorski@gmail.com>
To:     Jonas Gorski <jonas.gorski@gmail.com>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-mips@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/3] devicetree: document the BCM63XX gated clock bindings
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Kevin Cernekee <cernekee@gmail.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>
User-Agent: alot/0.8.1
Date:   Thu, 27 Jun 2019 13:36:57 -0700
Message-Id: <20190627203658.500AA20665@mail.kernel.org>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Jonas Gorski (2019-05-02 05:26:55)
> Add binding documentation for the gated clock controller found on MIPS
> based BCM63XX SoCs.
>=20
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> ---

Applied to clk-next

