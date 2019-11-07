Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BB16F34B9
	for <lists+linux-mips@lfdr.de>; Thu,  7 Nov 2019 17:38:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729509AbfKGQiM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 Nov 2019 11:38:12 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.84]:23645 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726877AbfKGQiL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 Nov 2019 11:38:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1573144689;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=RUuZUnY8v0t17sljokJZv0i1/4lvzd4ncub/rgk8kuU=;
        b=mcFwvJBjMcQ5QGtLelDfQ5HKRqAfcBS4kI2zpcgIUzR6hSZgO6x+bRFw9JRWxiCqom
        k9DT7xaOe5wVxSSQoss+gVaUdyx3UxGC3IkmQ6xSJzFzVzlVVHtvcnciOkdmbrvAq1Xb
        88pz5zotT+8LgC+k+SUYSvoSviGi1rb/M5xLNo2ve4ukhxiPIDIkNRPH+9LGuyPFgtWU
        DMRuqELK5gTAU1497CMAj5j3Y54j33T4b0vKNjw1doohtiBtIIqwDonl8EB+feHy9mRE
        QKIB8AwqFDtfgFsf9yJT+LNJTRMDoxlqQcvUh+90tr7ZgSRvdD/cDdLemtWYzDtKyeVx
        Oxzw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PrwDCq1eY="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
        with ESMTPSA id L09db3vA7GbsfsV
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Thu, 7 Nov 2019 17:37:54 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH v2 1/8] RFC: dt-bindings: add img,pvrsgx.yaml for Imagination GPUs
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20191107155401.GC5610@atomide.com>
Date:   Thu, 7 Nov 2019 17:37:54 +0100
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        openpvrsgx-devgroup@letux.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-mips@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <65C6747A-982A-4179-95AF-4061733978A1@goldelico.com>
References: <cover.1573124770.git.hns@goldelico.com> <4292cec1fd82cbd7d42742d749557adb01705574.1573124770.git.hns@goldelico.com> <20191107155401.GC5610@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


> Am 07.11.2019 um 16:54 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> * H. Nikolaus Schaller <hns@goldelico.com> [191107 11:07]:
>> +        - const: "ti,am335x-sgx530-125", "img,sgx530-125", =
"img,sgx530", "img,sgx5"
>=20
> This should be without the x, maybe use the earliest one here
> for "ti,am3352-sgx530-125" like we have for "ti,am3352-uart".

Ok, fine. Will update accordingly.

> We could use "ti,am3-sgx530-125" but that can get confused
> then with am3517 then.

Indeed.

BR and thanks,
Nikolaus

