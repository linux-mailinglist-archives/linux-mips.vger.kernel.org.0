Return-Path: <linux-mips+bounces-14637-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Mc+DMl5DGoSiQUAu9opvQ
	(envelope-from <linux-mips+bounces-14637-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 19 May 2026 16:55:05 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC55580F60
	for <lists+linux-mips@lfdr.de>; Tue, 19 May 2026 16:55:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6ABA83060968
	for <lists+linux-mips@lfdr.de>; Tue, 19 May 2026 14:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 738D93264EA;
	Tue, 19 May 2026 14:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eonNaHjg"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4493E3246FE;
	Tue, 19 May 2026 14:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779202492; cv=none; b=XnzC9nEe2iGXPPfcaXNbf2dNkYVzhUQYzilwAnwq2khb1xOhiFDLCrggYhhoUdgSt9yrAr93v8gfZ6BI3PVmsvwB2/Fy2VkX3MfwqIMaT45dyY0gpvUV2bjAfXOlVN3LWskDcNQ17lK+6vZKhnjuvD9XO4NwR+MYfN0yZg2EgpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779202492; c=relaxed/simple;
	bh=UC51TFFAdYAAEu3Hn1AG/aOnKPwgH/g/o3sh2GAq0HA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cGAtgkRRBg1pld8WvZXa2XY/KkmIeAxw3a0IykvQCJvFiwgqp7py44NJ71Wn+JaCs5w5u94o/UdP5Z3xOs64ZpSX3sICi+YdUae1ZAGJ+YBo89tQK/fohWy8ruNE7rgE3h3kv8phIzHa+m9MirnFxiNv5iXGHHVGmO+2hMjs/9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eonNaHjg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FA54C2BCB3;
	Tue, 19 May 2026 14:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779202491;
	bh=UC51TFFAdYAAEu3Hn1AG/aOnKPwgH/g/o3sh2GAq0HA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eonNaHjgLxe9B7jJYmeAsLPwIsWasueEug+6sELaPW6zhqCBLKCVV0eXFoe5YqR/1
	 S8bKD+SEITM0ZovBZW83+t7ypM3/0bjK1YzUjckPvv6g5Kdkmpcd6F2rAwUS7oEgNw
	 0kq4U3FeqHKd2W/uPZnkkMGekIuuSoakXy+iDUcby8YgheVKxHyrVDAzj2DEu552s9
	 NYwahujt0vth4USrNPOpkPip6bcEeKyVlm1Lo7eE96penUWhmF8uZW0o+BdWceb0sn
	 V9q+MgwaQynubQNmFwKwcPDI8qJpxB5heitif+1RJfxLJS2ZJ3mpkvmuu2wVKeWzqw
	 riPzTDUCCAeuw==
Message-ID: <eb236109-1284-43ad-bd0f-1a39765fa30f@kernel.org>
Date: Tue, 19 May 2026 16:54:31 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: crypto/ahash.c:1073:1: warning: the frame size of 1040 bytes is
 larger than 1024 bytes
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 kernel test robot <lkp@intel.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, wireguard@lists.zx2c4.com
References: <202605100125.l4JVHppO-lkp@intel.com>
 <CAMuHMdXPeUnjN__PvY+HQg+cSxKe-RLnyT-A5KGe=4cmjnUNbg@mail.gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <CAMuHMdXPeUnjN__PvY+HQg+cSxKe-RLnyT-A5KGe=4cmjnUNbg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14637-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,outlook.com:url,01.org:url,intel.com:email]
X-Rspamd-Queue-Id: CAC55580F60
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



Le 11/05/2026 à 08:42, Geert Uytterhoeven a écrit :
> On Sat, 9 May 2026 at 19:07, kernel test robot <lkp@intel.com> wrote:
>> FYI, the error/warning still remains.
>>
>> tree:   https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7Cb57c2e1952ea48b306d508deaf28809f%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639140785686768547%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=MBIlFF0TKur9ZxxdvLflUjFXN8BiEIWx%2FW2eO2rQteM%3D&reserved=0 master
>> head:   ec89572766744e844df24c27d31c97b4c00f4e07
>> commit: 9d9b193ed73a65ec47cf1fd39925b09da8216461 crypto: hash - Increase HASH_MAX_DESCSIZE for hmac(sha3-224-s390)
>> date:   9 months ago
>> config: mips-eyeq5_defconfig (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20260510%2F202605100125.l4JVHppO-lkp%40intel.com%2Fconfig&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7Cb57c2e1952ea48b306d508deaf28809f%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639140785686802803%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=9mLXlRz5JrVhRQ0Ft4c3tQJGrDtlSSmYmd7vZ4pneYc%3D&reserved=0)
>> compiler: mips64-linux-gcc (GCC) 15.2.0
>> reproduce (this is a W=1 build): (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20260510%2F202605100125.l4JVHppO-lkp%40intel.com%2Freproduce&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7Cb57c2e1952ea48b306d508deaf28809f%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639140785686823501%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=NNAWk0DHq2gD1%2FToE%2FXk75Mz3sKpppwVkpkDG6amzD0%3D&reserved=0)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Fixes: 9d9b193ed73a ("crypto: hash - Increase HASH_MAX_DESCSIZE for hmac(sha3-224-s390)")
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Foe-kbuild-all%2F202605100125.l4JVHppO-lkp%40intel.com%2F&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7Cb57c2e1952ea48b306d508deaf28809f%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639140785686842796%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=2M0BnhyxISt3rrzxPXkX4p%2Ba1bIVz%2FhjwSNokIVueuE%3D&reserved=0
>>
>> All warnings (new ones prefixed by >>):
>>
>>     crypto/ahash.c: In function 'crypto_hash_digest':
>>>> crypto/ahash.c:1073:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
>>      1073 | }
>>           | ^
> 
> This is one of the few defconfigs that still use CONFIG_FRAME_WARN=1024.
> The default value for 32-bit systems was lifted from 1024 to 1280 in
> commit 32115734c0ed8b46 ("Increase the default 32-bit build frame size
> warning limit to 1280 bytes") in v6.18, so perhaps the downgrade to
> 1024 should be dropped from the following defconfigs:
> 
> $ git grep CONFIG_FRAME_WARN=1024
> arch/mips/configs/eyeq5_defconfig:CONFIG_FRAME_WARN=1024
> arch/mips/configs/eyeq6_defconfig:CONFIG_FRAME_WARN=1024
> arch/mips/configs/eyeq6lplus_defconfig:CONFIG_FRAME_WARN=1024
> arch/mips/configs/lemote2f_defconfig:CONFIG_FRAME_WARN=1024
> arch/mips/configs/loongson2k_defconfig:CONFIG_FRAME_WARN=1024
> arch/powerpc/configs/fsl-emb-nonhw.config:CONFIG_FRAME_WARN=1024

I agree for that one, lets drop the downgrade, don't know why it was 
added at the first place as it was the default, most likely someone 
didn't use make savedefconfig

So feel from to drop that in a treewide cleanup with my Acked-by: 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>



> tools/testing/selftests/wireguard/qemu/arch/arm.config:CONFIG_FRAME_WARN=1024
> tools/testing/selftests/wireguard/qemu/arch/armeb.config:CONFIG_FRAME_WARN=1024
> tools/testing/selftests/wireguard/qemu/arch/i686.config:CONFIG_FRAME_WARN=1024
> tools/testing/selftests/wireguard/qemu/arch/m68k.config:CONFIG_FRAME_WARN=1024
> tools/testing/selftests/wireguard/qemu/arch/mips.config:CONFIG_FRAME_WARN=1024
> tools/testing/selftests/wireguard/qemu/arch/mipsel.config:CONFIG_FRAME_WARN=1024
> tools/testing/selftests/wireguard/qemu/arch/powerpc.config:CONFIG_FRAME_WARN=1024
> 
> I am not sure about the wireguard selftests: they might use the lower
> value deliberately for testing?
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 


