Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E69EEC9154
	for <lists+linux-mips@lfdr.de>; Wed,  2 Oct 2019 21:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728486AbfJBTIA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Oct 2019 15:08:00 -0400
Received: from srv1.deutnet.info ([116.203.153.70]:55578 "EHLO
        srv1.deutnet.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726669AbfJBTIA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Oct 2019 15:08:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deutnet.info; s=default; h=In-Reply-To:Date:Message-ID:From:Cc:To:Subject;
         bh=GPbfP2XqzSm9W2BgYoWtnF6GLdAaFGBJlwx9yssXOL4=; b=jAlS8eEwe0nr46Xlvl9cGGNxu
        YOKCdVxuQQhMBuF7pRYBbVPAJFPB+V/zRDGx2a+NV3Qcak4JvDwLb4vRyR4ZnOhN2YuRNs1gYsThD
        TpaoYyjQojZ+QXKU6wEqBSpfZp3pPYOmoPSbT6m1C9JZ1RP/6g4SKrj/k13K/cfXgDStupbFOnZkH
        e+omvoLpE3bYxByUgy7q1PsI1f0Evl8Ia5LqzN+W0pIliJQBIT4bthAjOG8MpFi/J9He//44Re6JN
        r0CfAjKjnZJJIkRlkgvavMf/1OKmlXF51xpvUEaGwmUlspDzBv0/TiWPAd0ajbwd0cZO0ZBcESuSA
        w8BeCVzaw==;
Received: from [2001:41d0:fe79:6701::b64]
        by srv1.deutnet.info with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <agriveaux@deutnet.info>)
        id 1iFjye-00073o-Si; Wed, 02 Oct 2019 21:07:57 +0200
Subject: Re: [PATCH v2 5/5] MIPS: JZ4780: DTS: Add CPU nodes
To:     Paul Burton <paul.burton@mips.com>
Cc:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "ralf@linux-mips.org" <ralf@linux-mips.org>,
        "jhogan@kernel.org" <jhogan@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <cover.1569955865.git.agriveaux@deutnet.info>
 <0dbd1986be4ee50bdd9f45c140aded7c49fddb8a.1569955865.git.agriveaux@deutnet.info>
 <20191001232031.qaci6hk5tjo652mi@pburton-laptop>
From:   Alexandre GRIVEAUX <agriveaux@deutnet.info>
Openpgp: preference=signencrypt
Autocrypt: addr=agriveaux@deutnet.info; prefer-encrypt=mutual; keydata=
 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
 z6YGVVQX+YQhrew=
Message-ID: <61516f78-18a9-2702-2812-312b05cd0279@deutnet.info>
Date:   Wed, 2 Oct 2019 21:07:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191001232031.qaci6hk5tjo652mi@pburton-laptop>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: fr
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul and other.
> Hi Alexandre,
> This should probably be something like ingenic,xburst2. JZ4780 is the
> SoC. It also should be a documented binding, but I think it would be
> worth holding off on the whole thing until we actually get SMP support
> merged - just in case we come up with a binding that doesn't actually
> work out.
>
> So I expect I'll just apply patches 1-4 for now.
>
> Thanks for working on it!

I holding the CPU patch at this time for more work later, I would like
to upstream some patchs from this repository:

https://github.com/MIPS/CI20_linux.git


How i can do that and keep the contributors history ?


Thanks for the help.

Ps: I try to unban my e-mail server from office365...


