Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D198F33D0
	for <lists+linux-mips@lfdr.de>; Thu,  7 Nov 2019 16:54:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388539AbfKGPyG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 Nov 2019 10:54:06 -0500
Received: from muru.com ([72.249.23.125]:40712 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726231AbfKGPyG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 7 Nov 2019 10:54:06 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 358818117;
        Thu,  7 Nov 2019 15:54:40 +0000 (UTC)
Date:   Thu, 7 Nov 2019 07:54:01 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        openpvrsgx-devgroup@letux.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 1/8] RFC: dt-bindings: add img,pvrsgx.yaml for
 Imagination GPUs
Message-ID: <20191107155401.GC5610@atomide.com>
References: <cover.1573124770.git.hns@goldelico.com>
 <4292cec1fd82cbd7d42742d749557adb01705574.1573124770.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4292cec1fd82cbd7d42742d749557adb01705574.1573124770.git.hns@goldelico.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [191107 11:07]:
> +        - const: "ti,am335x-sgx530-125", "img,sgx530-125", "img,sgx530", "img,sgx5"

This should be without the x, maybe use the earliest one here
for "ti,am3352-sgx530-125" like we have for "ti,am3352-uart".

We could use "ti,am3-sgx530-125" but that can get confused
then with am3517 then.

Regards,

Tony
