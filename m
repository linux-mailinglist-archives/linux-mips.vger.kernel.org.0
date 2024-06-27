Return-Path: <linux-mips+bounces-3983-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA7C91A46C
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 13:00:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F084D1C219C1
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 11:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D646614037F;
	Thu, 27 Jun 2024 11:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YG/chIS6"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C1913E40C;
	Thu, 27 Jun 2024 11:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719486008; cv=none; b=Kc8TAd+x7ZBPVOPb600wj+cCvtan671zfuQGb0e3KSUx19jlGAp8pkoCQi/DXx9dXkRg9xgNvU2fuIMbGQzsVXlKKHfIWOJvLahO0Hvn52vCflUWIVupwSJyLehxm15FniZqlOnJ4wIxk/xQEOAIx/FCxA1imBtzAIvjwxaNwGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719486008; c=relaxed/simple;
	bh=eNIKGCo6TvOxdKg2GgKTH+S39gKZ6k+FdpCo4+14MbM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oHqoPkF01TC8E6PPYda/MiJLpc6BeG+4tChlKWQ/w0NAQF4sMpXOlgud6IIO51NyIAGQQHwnr84L9gUoKe5wU6CbMToYA2bSdcLByIqsyA9e3sGLdKwENYOSeEXEnjJMRc0/e3DuBLpg81YHRhgxD8ojIkAI9jVUJyzmyNLa5qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YG/chIS6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B093C2BBFC;
	Thu, 27 Jun 2024 10:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719486008;
	bh=eNIKGCo6TvOxdKg2GgKTH+S39gKZ6k+FdpCo4+14MbM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YG/chIS6cxoZ0LmJUKfo4XpwRCvW7WkkhxXGdTwIaDMb9X0SrOauWxAxUFGau5BGW
	 eGt9CohT1OY2L/S7HhrcCpOFdTUk1HZorcq1T7vSVj4toCGmLZFH0iyK+8G4R2qua6
	 wcZeci8WqKxktS/7QjM6ZpH4rkFLll1Q7PtZqhfJPX3WQ3CAO8IjzC8XUYt/J+dgxp
	 iBcqLLggtOJA448ozjAES8vDTZfDWKmu5vehVYNoa2E9IyV+cT9iNssnRL5dQFjs0x
	 CWbm5C8VDWVCYuHhigulSQivQynytLszpk6roLd0R86qsS23NrsXD4ss8oNseppuUT
	 h7VNcNzHZEZNw==
Date: Thu, 27 Jun 2024 12:59:49 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: tglx@linutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, tsbogend@alpha.franken.de, daniel.lezcano@linaro.org,
 paulburton@kernel.org, peterz@infradead.org, mail@birger-koblitz.de,
 bert@biot.com, john@phrozen.org, sander@svanheule.net,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org, ericwouds@gmail.com
Subject: Re: [PATCH v3 1/9] mips: dts: realtek: use "serial" instead of
 "uart" in node name
Message-ID: <20240627125949.7c15a65d@dellmb>
In-Reply-To: <20240627043317.3751996-2-chris.packham@alliedtelesis.co.nz>
References: <20240627043317.3751996-1-chris.packham@alliedtelesis.co.nz>
	<20240627043317.3751996-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 27 Jun 2024 16:33:09 +1200
Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:

> Update the node name for the UARTs to resolve the following dtbs_check
> complaints:
>=20
>   uart@2000: $nodename:0: 'uart@2000' does not match '^serial(@.*)?$'
>   uart@2100: $nodename:0: 'uart@2100' does not match '^serial(@.*)?$'
>=20
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Reviewed-by: Marek Beh=C3=BAn <kabel@kernel.org>

