Return-Path: <linux-mips+bounces-3352-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA4D8D19C5
	for <lists+linux-mips@lfdr.de>; Tue, 28 May 2024 13:38:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A70D828AC05
	for <lists+linux-mips@lfdr.de>; Tue, 28 May 2024 11:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CEEE16C845;
	Tue, 28 May 2024 11:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="TWgNXuMv"
X-Original-To: linux-mips@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77AF16C6B1;
	Tue, 28 May 2024 11:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716896286; cv=none; b=nHY4GHJUcg0vUSjjPgqxtdrWxKtiYBItiKM/G7ISFSZoR05OJbEYN0kpCWfCKWSjpLoaVWz7cAOrSjMzkR+ndXjDJOGvIKfTiKc9aXxyFTk+MdAJcAK7fly/ELVAfvFK6hLuhrAZLIXJyJjM5nCHnlLFwAYbduamN/DhlnWt0SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716896286; c=relaxed/simple;
	bh=iIEfkaLcBZrLnXPb98Krsanziumo17QkX9cbSc6RakU=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=PbaUgLva9KBWDXjotCh32Eywjd9wRWHU1h8A7lelIQoASEMIaawLkA9L8Ll0ah0kvHZg2+e2vZMtNLDPfgdsFgi09P6Sa97Qukfl6TyIVeFQLq2VVSDZCL6/R1eNF8tWpnU+mfnVNTpUdQYZzoqJK8whesNi64zQzC0CR/6TqNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=TWgNXuMv; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716896259; x=1717501059; i=markus.elfring@web.de;
	bh=TDvFBcJGyPwRaT6zbKz3iL8MSVk3ipgQOdseEeqP3Oo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=TWgNXuMvD9jrT87vwEeAqB6F/Y1R3BBMFNEmuFE3hWpNBkauYtFT3ijCfkXfWw/2
	 QA+0x+wWGG0oCylh1hvtgEoWuZO0aiCZu3tXm6P2eY6/NX9MGbIHZSERumye5rS0g
	 6s3eyLcutS+H4gWKliP+8uAKu4xv3VMJANFmFA4AG1uyJbX3YhKuduvPg6HGRZugX
	 iRm/TavfTS+shBwmilOzdNMCCRcp4C4el8b8xQUZoEEN0qG59VC5Q1mQkb2N94lIG
	 j5kiD/2XF4cHV1Nqqnk5rrUKiNo6t8nuZ1+Sh7HqZThD4kKm3zA/Iqyd2xu+CN4Gf
	 w+3eSx9ZeFFL5X0zDA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MyvBA-1sPTn731G6-00vx4O; Tue, 28
 May 2024 13:37:39 +0200
Message-ID: <9abb1d5e-fdac-4500-9218-fb9f28ff2c05@web.de>
Date: Tue, 28 May 2024 13:37:33 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Weihao Li <cn.liweihao@gmail.com>, linux-gpio@vger.kernel.org,
 linux-mips@vger.kernel.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?QXLEsW7DpyDDnG5hbA==?= <arinc.unal@arinc9.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240527022036.31985-1-user@blabla>
Subject: Re: [PATCH] pinctrl: ralink: mt76x8: fix pinmux function
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240527022036.31985-1-user@blabla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5QkSmp5bnBaXcyDYB3+Ih3oVkyDJtxHb/IzWgk/DY8NzsXDVZg6
 QWk3eZqikcrEs8miOgajsxVgKq+rlIOuLQtMCPj9jKFJSjGTUZTagp/PxcHPA0rDgNTMFnJ
 9fffCIAM/h4Nxfe7lYa2sDjpUuYfPlm4aNm8KX0dqnDpnmGhAqF0f10WEdxcEX63N0VLXVs
 JGGNeQlNRKTwSQnLaDZ2A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:V7J8FSJ60RI=;BPsXQDfKwdHj7znD2lR8xkEVM4G
 MTgW1lUc2eByEVsKs+jfIGQWsJ5XF+09sJtvksTq72coBXuW5W8ZZ0IIjdsQXN829BCPPckje
 4lMphmJH3SRDGB1aZoDZ2vXakerGWL0OrBtlIXyxk2gyAi77FDkbtVZUKdL/5VV1t+Pg+9hAA
 40atqIs60e9vYXd6LOmelQkP3I5drwPMLJjdhz21who7qcyVHXQfhyr8bp35eoOGnn3zZtZ5e
 y3XA+CoEPSY9q+Hs5zm8PjUI/c8PcHxQn+NloqQ8fxxrymF9cKwjLjjDuFuYcobRt4XnVVJzq
 DOG8T/Iqx8b/WjoGke/GVpyVncHtEVdsvxH4ufAi7bbFCBJ37EyAvDJ3dSXSIAjc+fYkT60lc
 7kRCOvpoaLg+abEKpWIJEYYtsuIxuAsoU7hp0CY+9sdQ2Z+eDeEPWuvwEmSvoxk+ZkIzgPUzc
 TjoOsfMXlFCOrh3n5uN8xPEIzYEysVAdXa+73b3ZzkSQqNk4gPnb/KQtX2YQjRW4HM32awVrO
 xqVHBYZH1CvIN0AUBUcZynt9gDIQWbPopvh7qtXh4TrFeG9tb6vNDel3jtMY15H3nYWHvHFz3
 WQwXMb4ByE7Ruy6Jbqpi3gf5cQ8LIJ25M7OAlKu2N9TCBkdkWSqLnUlfctJjcc4mUmPTYt5/7
 zyCcMjuXToXeEL+f2O8o3+Va5ZuC7zuJnuwyw0xcXzrYMLuCZ5Di4FrHMp3KrUDgS+l14+ryo
 EXP9PuUJg6nKZehG+ww9+R3aK9teE3Iy/eK8Ohw5UIN665blXy/WLsb6X3veVhWomjsw3WU7k
 GCTba0XjzbV+gdBFztJyI9yY1Hgy0v8iXP5GpRkn2ZIQk=

=E2=80=A6
> There are some same function name in different pin groups, =E2=80=A6

                               names?


=E2=80=A6
> To solve this problem, a simple way is just add a pingrp refix to

                                                    pin group prefix?

Regards,
Markus

