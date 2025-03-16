Return-Path: <linux-mips+bounces-8210-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 124B6A6368E
	for <lists+linux-mips@lfdr.de>; Sun, 16 Mar 2025 18:00:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E03516E43E
	for <lists+linux-mips@lfdr.de>; Sun, 16 Mar 2025 17:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF2FF12F5A5;
	Sun, 16 Mar 2025 17:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="p8HB5Aw0";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="qHfiG8wb"
X-Original-To: linux-mips@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8FF13B58A;
	Sun, 16 Mar 2025 17:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742144417; cv=pass; b=ld6m0mwNQ5RHQ8pCQ9T8Z+Wp9OjkS92cBHla35wCkEzDaRiwiKRi+1EJa813ctqq4QbQCRiYaHtimfCbC8oI0W1xEYbzcwKi0sjf6Zqe2OiOOH07Y4HENjwsbAeYbxead7Jt5MafBRlCQAkIPvUnH1rINFDWuqmslym+KF9UN4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742144417; c=relaxed/simple;
	bh=/a4WBsJNkt2omozlDXzrC9B/dm4g50s1qwxJ6l1r5aw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=f1boOhH/i5Ct0oLzqPaUwW/iHgp0Di3029F5k8Uqhe1m2LGCZDSClFe4gTAVmuTYRyb5Y97JyqGtXZYKg5LAZwgOAmkXRsLSTbjhbwB8sPjdrj5mVlAEAZOZbz4u6jROklI33+h7Zl/Yc1lp9WTLO4KMllVl8C1R4L/ezaywH3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=p8HB5Aw0; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=qHfiG8wb; arc=pass smtp.client-ip=85.215.255.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1742144388; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=YoodfKxRBhB1/YfU5sEuhAMM6fpqu0ylzwJg/dBIugP2T4vRVhJamCed0/Wpx/jH3H
    xZfHZq3MmpeZ4JUUhzE2okI/ZaeyRw14tOEFl6AzyyTVi9Gtm4i240ipWixL05X9Emot
    rsMf567G5FVIHHE9Z/WVcFmabwprQGQBdddC2BkmjPmO9NdwAgbOdqv50caA7T0bX04X
    RjCInMvJAjrJc2QxTXAoiDjdn3es4yGtahAzqi1XmCmJ1LqaUrEFFr1PtxinYqvz//cc
    8rifEkNFU11SMBFEOxVBlszq32AEo7d+8ovIQcvZa0GmODZz0xGjraMyVpPvoSmyf85I
    2nIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1742144388;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=/a4WBsJNkt2omozlDXzrC9B/dm4g50s1qwxJ6l1r5aw=;
    b=rN3GqVQahxfHaEpR+H/ehBNgC2TGP2P+htCMBhJxvM+O5jx3TeXfmM4JjRgufXt9Kx
    pDbJZ0HcRsRSB0TFOeD44G+VLqbff7ShwYLm6/9pgBDhIt7NC+PV5GG281Q9kJ1Wh77k
    TfwMBu3bCqhSQWQV1RIgWXw22tUzEwAbxx12yJKfYDXC65rq27+9g6jsWtGWoy82da29
    l6wyuDvSNJ6YtEPG++ykm864JLMQ/RvBSatsYRXnqGUD7NgcNNwVu9f/noIVhYaJEQyM
    8lljfwtZUatqlLUIr2lfy7b/jO45/xqQjENcJv1yBPozwvMQ2i4CbCfpu5GSYWQCwb/O
    VIbw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1742144388;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=/a4WBsJNkt2omozlDXzrC9B/dm4g50s1qwxJ6l1r5aw=;
    b=p8HB5Aw0OWYcG++rh2RREItn6pc9Wjg8V0lOCygSUgkO1GwbAXsUMPd3gd1sl92qdk
    XcKhkDHI02ArrwVnoK3GK810A34HNPlGWov2chUGRKOATPNOazVyAnAQUk7wSFY8OtdC
    HZb4JGlmYPRoEMjuJmbkW9VDXUT2DzhQv/SzRHZ7pyh2vT246G+zyTJBU9MN8K2biF9x
    Q7hUZnpSGSIyiDrXL0V0oppMYS0bAacdsrE2BplKe6X+PPc1mpmNbziPHRvRmg/58idE
    z87BfUy1CYrjbQyIOs1gCtB/8c4T4cQAGLr/sWB4PCfXPjGOAxUcIICkoOWS2OE2xmok
    Fu3A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1742144388;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=/a4WBsJNkt2omozlDXzrC9B/dm4g50s1qwxJ6l1r5aw=;
    b=qHfiG8wbdo54bqVuztfX0onua4cK4guN8SxMVYW3avnF6wDnN/2sJwzWWHrlVbRfIV
    1Mi4ED4WymReyJtbxgDA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yeTkZ"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.3.0 DYNA|AUTH)
    with ESMTPSA id Q56adc12GGxluvH
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Sun, 16 Mar 2025 17:59:47 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [PATCH RESEND] phy: ingenic: fix unbalanced regulator_disable()
 warning
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <Z9b+wSNdyE1hN+cn@vaman>
Date: Sun, 16 Mar 2025 17:59:36 +0100
Cc: Paul Cercueil <paul@crapouillou.net>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Zhou Yanjie <zhouyanjie@wanyeetech.com>,
 linux-phy@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 kernel@pyra-handheld.com,
 linux-mips@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <3C1066EE-405D-43C6-912A-11943F1F43E9@goldelico.com>
References: <96da5fe557f3b2501447358895bd78decc4633ef.1735482146.git.hns@goldelico.com>
 <ab308c135c3ea5e050bbfb0b94a832c8d52d5380.camel@crapouillou.net>
 <AF49A39E-0534-4ADC-8E50-606A636D167A@goldelico.com>
 <c67e2ecbcdf481cddcc4c93716e38049e53d3e93.camel@crapouillou.net>
 <Z9b+wSNdyE1hN+cn@vaman>
To: Vinod Koul <vkoul@kernel.org>
X-Mailer: Apple Mail (2.3776.700.51.11.1)

Hi Vinod,

> Am 16.03.2025 um 17:39 schrieb Vinod Koul <vkoul@kernel.org>:
>=20
> On 14-03-25, 11:33, Paul Cercueil wrote:
>> Vinod, can you take this?
>=20
> I dont seem to have this in my queue, can you pls post it again
>=20
> --=20
> ~Vinod
>=20

Here it is:

=
https://patchwork.kernel.org/project/linux-phy/patch/96da5fe557f3b25014473=
58895bd78decc4633ef.1735482146.git.hns@goldelico.com/

Strangely it wasn't collected by =
https://patchwork.kernel.org/project/linux-mips/list/

BR and thanks,
Nikolaus


